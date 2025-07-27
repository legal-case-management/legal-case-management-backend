package server.service;

import server.dto.request.IntrospectRequest;
import server.dto.request.authentication.LoginRequest;
import server.dto.request.authentication.LogoutRequest;
import server.dto.request.authentication.RefreshTokenRequest;
import server.dto.response.authentication.AuthenticationResponse;
import server.entity.Account;
import server.exception.AppException;
import server.exception.ErrorCode;
import server.mapper.AccountMapper;
import server.mapper.JudgeMapper;
import server.repository.AccountRepository;
import com.nimbusds.jose.*;
import com.nimbusds.jose.crypto.MACSigner;
import com.nimbusds.jose.crypto.MACVerifier;
import com.nimbusds.jwt.JWTClaimsSet;
import com.nimbusds.jwt.SignedJWT;
import server.repository.JudgeRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.experimental.NonFinal;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.*;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class AuthenticationService {
    @NonFinal
    @Value("${jwt.signerKey}")
    String SIGNER_KEY;

    @NonFinal
    @Value("${jwt.valid-duration}")
    long VALID_DURATION;

    @NonFinal
    @Value("${jwt.refreshable-duration}")
    long REFRESHABLE_DURATION;

    RedisTemplate<String, Boolean> redisTemplate;
    AccountRepository accountRepository;
    JudgeRepository judgeRepository;

    AccountMapper accountMapper;
    JudgeMapper judgeMapper;

    PasswordEncoder passwordEncoder;

    public AuthenticationResponse login(LoginRequest request) {
        /* Find account in database*/
        String identifier = request.getIdentifier();
        String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";

        Account account = identifier.matches(emailRegex)
                ? accountRepository.findAccountByEmail(identifier)
                .orElseThrow(() -> new AppException(ErrorCode.ACCOUNT_NOT_EXISTED))
                : accountRepository.findAccountByUsername(identifier)
                .orElseThrow(() -> new AppException(ErrorCode.ACCOUNT_NOT_EXISTED));

        /* Check password*/
        boolean authenticated = passwordEncoder.matches(request.getPassword(), account.getPassword());
        if (!authenticated)
            throw new AppException(ErrorCode.UNAUTHENTICATED);

        try {
            /* Create token*/
            String token = generateToken(account);
            return AuthenticationResponse
                    .builder()
                    .authenticated(true)
                    .token(token)
                    .build();
        } catch (JOSEException e) {
            throw new AppException(ErrorCode.TOKEN_GENERATION_FAILED);
        }
    }

    public void introspect(IntrospectRequest request) {
        try {
            /* Verify token*/
            verifyToken(request.getToken(), false);
        } catch (JOSEException | ParseException e) {
            throw new AppException(ErrorCode.AUTHENTICATION_FAILED);
        }
    }

    public void logout(LogoutRequest request) {
        try {
            /* Verify token*/
            verifyToken(request.getToken(), true);

            /* Add token to redis*/
            SignedJWT signedJWT = SignedJWT.parse(request.getToken());
            addTokenToRedis(signedJWT);
        } catch (JOSEException | ParseException e) {
            throw new AppException(ErrorCode.LOGOUT_FAILED);
        }
    }

    public AuthenticationResponse refreshToken(RefreshTokenRequest request) {
        try {
            /* Verify token*/
            verifyToken(request.getToken(), true);

            /* Add token to redis*/
            SignedJWT signedJWT = SignedJWT.parse(request.getToken());
            addTokenToRedis(signedJWT);

            /* Find account in database*/
            String accountId = signedJWT.getJWTClaimsSet().getSubject();
            Account account = accountRepository.findById(accountId)
                    .orElseThrow(() -> new AppException(ErrorCode.ACCOUNT_NOT_EXISTED));

            /* Create token with account*/
            String token = generateToken(account);
            return AuthenticationResponse
                    .builder()
                    .authenticated(true)
                    .token(token)
                    .build();
        } catch (JOSEException | ParseException e) {
            throw new AppException(ErrorCode.REFRESH_TOKEN_FAILED);
        }
    }

    public String generateToken(Account account) throws JOSEException {
        JWSHeader jwsHeader = new JWSHeader(JWSAlgorithm.HS256);

        JWTClaimsSet jwtClaimsSet = new JWTClaimsSet
                .Builder()
                .jwtID(UUID.randomUUID().toString())
                .subject(account.getAccountId())
                .issuer("QuanLyAn_ToaAnKhuVuc9_DongThap")
                .issueTime(new Date())
                .expirationTime(new Date(
                        Instant.now().plus(VALID_DURATION, ChronoUnit.SECONDS).toEpochMilli()
                ))
                .claim("username", account.getUsername())
                .claim("displayName", account.getJudge() != null
                        ? account.getJudge().getLastName() + " " + account.getJudge().getFistName()
                        : null)
                .claim("judge_id",
                        account.getJudge() != null
                                ? account.getJudge().getJudgeId()
                                : null
                )
                .claim("scope", account.getRole().name())
                .build();

        Payload payload = new Payload(jwtClaimsSet.toJSONObject());

        JWSObject jwsObject = new JWSObject(jwsHeader, payload);

        jwsObject.sign(new MACSigner(SIGNER_KEY.getBytes()));
        return jwsObject.serialize();
    }

    private void verifyToken(String token, boolean isRefreshTime) throws JOSEException, ParseException {
        JWSVerifier jwsVerifier = new MACVerifier(SIGNER_KEY.getBytes());
        SignedJWT signedJWT = SignedJWT.parse(token);

        if (!signedJWT.verify(jwsVerifier))
            throw new AppException(ErrorCode.TOKEN_INVALID);

        Date expirationTime = isRefreshTime
                ? new Date(signedJWT
                .getJWTClaimsSet()
                .getIssueTime()
                .toInstant()
                .plus(REFRESHABLE_DURATION, ChronoUnit.SECONDS)
                .toEpochMilli())
                : signedJWT.getJWTClaimsSet().getExpirationTime();
        if (!expirationTime.after(new Date()))
            throw new AppException(ErrorCode.TOKEN_EXPIRED);

        String jwtId = signedJWT.getJWTClaimsSet().getJWTID();
        Boolean isBlacklisted = redisTemplate.opsForValue().get("blacklist:" + jwtId);
        if (Boolean.TRUE.equals(isBlacklisted))
            throw new AppException(ErrorCode.TOKEN_LOGGED_OUT);
    }

    private void addTokenToRedis(SignedJWT signedJWT) throws ParseException {
        String jwtId = signedJWT.getJWTClaimsSet().getJWTID();

        Date expirationTime = signedJWT.getJWTClaimsSet().getExpirationTime();
        long currentMillis = System.currentTimeMillis();
        long expirationMillis = expirationTime.getTime();
        long remainingTime = (expirationMillis - currentMillis) / 1000;

        redisTemplate.opsForValue().set("blacklist:" + jwtId, true, remainingTime, java.util.concurrent.TimeUnit.SECONDS);
    }
}
