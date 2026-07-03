package com.qlatakv9dt.config;

import com.nimbusds.jose.JWSVerifier;
import com.nimbusds.jose.crypto.MACVerifier;
import com.nimbusds.jwt.SignedJWT;
import lombok.AccessLevel;
import lombok.experimental.FieldDefaults;
import lombok.experimental.NonFinal;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.simp.stomp.StompCommand;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.messaging.support.ChannelInterceptor;
import org.springframework.messaging.support.MessageHeaderAccessor;
import org.springframework.stereotype.Component;

import java.security.Principal;
import java.util.Date;
import java.util.List;

@Component
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class StompAuthChannelInterceptor implements ChannelInterceptor {

    @NonFinal
    @Value("${jwt.signerKey}")
    String signerKey;

    @Override
    public Message<?> preSend(Message<?> message, MessageChannel channel) {
        StompHeaderAccessor accessor =
                MessageHeaderAccessor.getAccessor(message, StompHeaderAccessor.class);

        if (accessor != null && StompCommand.CONNECT.equals(accessor.getCommand())) {
            String token = resolveToken(accessor);
            String accountId = verifyAndGetSubject(token);
            if (accountId != null) {
                accessor.setUser(new StompPrincipal(accountId));
            }
        }
        return message;
    }

    private String resolveToken(StompHeaderAccessor accessor) {
        List<String> authHeaders = accessor.getNativeHeader("Authorization");
        if (authHeaders != null && !authHeaders.isEmpty()) {
            String value = authHeaders.get(0);
            if (value != null && value.startsWith("Bearer ")) {
                return value.substring(7);
            }
            return value;
        }
        List<String> tokenHeaders = accessor.getNativeHeader("accessToken");
        if (tokenHeaders != null && !tokenHeaders.isEmpty()) {
            return tokenHeaders.get(0);
        }
        return null;
    }

    private String verifyAndGetSubject(String token) {
        if (token == null || token.isBlank()) {
            return null;
        }
        try {
            JWSVerifier verifier = new MACVerifier(signerKey.getBytes());
            SignedJWT signedJWT = SignedJWT.parse(token);
            if (!signedJWT.verify(verifier)) {
                return null;
            }
            Date expiration = signedJWT.getJWTClaimsSet().getExpirationTime();
            if (expiration == null || !expiration.after(new Date())) {
                return null;
            }
            return signedJWT.getJWTClaimsSet().getSubject();
        } catch (Exception e) {
            return null;
        }
    }

    public record StompPrincipal(String name) implements Principal {
        @Override
        public String getName() {
            return name;
        }
    }
}
