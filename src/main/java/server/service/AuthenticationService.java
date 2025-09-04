package server.service;

import lombok.Synchronized;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.transaction.annotation.Transactional;
import server.dto.request.authentication.*;
import server.dto.response.authentication.AuthenticationResponse;
import server.dto.response.authentication.RecoverPasswordResponse;
import server.entity.Account;
import server.entity.Judge;
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
import java.util.concurrent.TimeUnit;

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

    @Value("${auth.default-password}")
    @NonFinal
    String DEFAULT_PASSWORD;

    RedisTemplate<String, String> redisTemplate;
    AccountRepository accountRepository;

    AccountMapper accountMapper;

    PasswordEncoder passwordEncoder;

    public AuthenticationResponse login(LoginRequest request) {
        /* 1. Find account in database*/
        String identifier = request.getIdentifier();
        String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";

        Account account = identifier.matches(emailRegex)
                ? accountRepository.findAccountByEmail(identifier)
                .orElseThrow(() -> new AppException(ErrorCode.ACCOUNT_NOT_EXISTED))
                : accountRepository.findAccountByUsername(identifier)
                .orElseThrow(() -> new AppException(ErrorCode.ACCOUNT_NOT_EXISTED));

        /* 2. Check password*/
        boolean authenticated = passwordEncoder.matches(request.getPassword(), account.getPassword());
        if (!authenticated)
            throw new AppException(ErrorCode.INVALID_PASSWORD);

        try {
            // 3. Generate new token
            String token = generateToken(account);

            // 4. Xóa token cũ trong Redis (nếu có)
            String redisKey = "account:" + account.getAccountId() + ":token";
            redisTemplate.delete(redisKey);

            // 5. Lưu token mới vào Redis với TTL
            redisTemplate.opsForValue().set(redisKey, token, VALID_DURATION, TimeUnit.SECONDS);

            // 6. Return token
            return AuthenticationResponse.builder()
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
            SignedJWT signedJWT = verifyToken(request.getToken(), true);

            /* Remote token to redis*/
            String accountId = signedJWT.getJWTClaimsSet().getSubject();
            String redisKey = "account:" + accountId + ":token";
            redisTemplate.delete(redisKey);
        } catch (JOSEException | ParseException e) {
            throw new AppException(ErrorCode.LOGOUT_FAILED);
        }
    }

    public AuthenticationResponse refreshToken(RefreshTokenRequest request) {
        try {
            SignedJWT signedJWT = verifyToken(request.getToken(), true);
            String accountId = signedJWT.getJWTClaimsSet().getSubject();

            // Check account exists
            Account account = accountRepository.findById(accountId)
                    .orElseThrow(() -> new AppException(ErrorCode.ACCOUNT_NOT_EXISTED));

            // Generate new token
            String token = generateToken(account);

            // Update Redis
            String redisKey = "account:" + account.getAccountId() + ":token";
            redisTemplate.opsForValue().set(redisKey, token, VALID_DURATION, TimeUnit.SECONDS);

            return AuthenticationResponse.builder()
                    .authenticated(true)
                    .token(token)
                    .build();
        } catch (Exception e) {
            throw new AppException(ErrorCode.REFRESH_TOKEN_FAILED);
        }
    }

    public void changePassword(ChangePasswordRequest request) {
        // Lấy accountId từ JWT token trong SecurityContext
        String accountId = SecurityContextHolder.getContext().getAuthentication().getName();

        // Tìm account trong database
        Account account = accountRepository.findById(accountId)
                .orElseThrow(() -> new AppException(ErrorCode.ACCOUNT_NOT_EXISTED));

        if(request.getNewPassword().equals(request.getConfirmNewPassword()))
            throw new AppException(ErrorCode.NEW_PASSWORD_NOT_MATCH);

        // Kiểm tra mật khẩu cũ
        if (!passwordEncoder.matches(request.getCurrentPassword(), account.getPassword())) {
            throw new AppException(ErrorCode.INVALID_PASSWORD);
        }

        // Cập nhật mật khẩu mới
        account.setPassword(passwordEncoder.encode(request.getNewPassword()));
        accountRepository.save(account);
    }


    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void createAccount(AccountRequest request){
        createAccount(accountMapper.toAccount(request));
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void updateAccount(String id, AccountRequest request){
        if(accountRepository.existsByUsername(request.getUsername()))
            throw new AppException(ErrorCode.USERNAME_EXISTED);

        if(accountRepository.existsByEmail(request.getEmail()))
            throw new AppException(ErrorCode.EMAIL_EXISTED);

        Account account = accountRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.ACCOUNT_NOT_EXISTED));

        account.setUsername(request.getUsername());
        account.setEmail(request.getEmail());
        account.setRole(request.getRole());

        accountRepository.save(account);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void deleteAccount(String id){
        Account account = accountRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.ACCOUNT_NOT_EXISTED));

        accountRepository.delete(account);
    }

//    @PreAuthorize("hasAnyRole('ADMIN')")
//    @Async
//    @Synchronized
//    @Transactional
//    public RecoverPasswordResponse recoverPassword(RecoverPasswordRequest request) {
//        Account account = accountRepository.findAccountByEmail(request.getEmail())
//                .orElseThrow(() -> new AppException(ErrorCode.ACCOUNT_NOT_EXISTED));
//
//        String newPassword = UUID.randomUUID().toString().substring(0, 8);
//        account.setPassword(passwordEncoder.encode(newPassword));
//        accountRepository.save(account);
//
//        return RecoverPasswordResponse
//                .builder()
//                .newPassword(newPassword)
//                .build();
//    }

    public void createAccount(Account account){
        if(accountRepository.existsByUsername(account.getUsername())){
            throw new AppException(ErrorCode.USERNAME_EXISTED);
        }

        if(accountRepository.existsByEmail(account.getEmail())){
            throw new AppException(ErrorCode.EMAIL_EXISTED);
        }

        account.setPassword(passwordEncoder.encode(DEFAULT_PASSWORD));
        accountRepository.save(account);
    }

    private String generateToken(Account account) throws JOSEException {
        JWSHeader header = new JWSHeader(JWSAlgorithm.HS256);

        JWTClaimsSet claims = new JWTClaimsSet.Builder()
                .jwtID(UUID.randomUUID().toString())
                .subject(account.getAccountId())
                .issuer("QuanLyAn_ToaAnKhuVuc9_DongThap")
                .issueTime(new Date())
                .expirationTime(new Date(Instant.now().plus(VALID_DURATION, ChronoUnit.SECONDS).toEpochMilli()))
                .claim("username", account.getUsername())
                .claim("displayName", account.getJudge() != null
                        ? account.getJudge().getLastName() + " " + account.getJudge().getFirstName()
                        : null)
                .claim("judgeId", account.getJudge() != null ? account.getJudge().getJudgeId() : null)
                .claim("scope", account.getRole().name())
                .build();

        JWSObject jwsObject = new JWSObject(header, new Payload(claims.toJSONObject()));
        jwsObject.sign(new MACSigner(SIGNER_KEY.getBytes()));

        return jwsObject.serialize();
    }

    private SignedJWT verifyToken(String token, boolean isRefresh) throws JOSEException, ParseException {
        JWSVerifier verifier = new MACVerifier(SIGNER_KEY.getBytes());
        SignedJWT signedJWT = SignedJWT.parse(token);

        if (!signedJWT.verify(verifier)) {
            throw new AppException(ErrorCode.TOKEN_INVALID);
        }

        // Check expiration time
        Date expirationTime = isRefresh
                ? Date.from(signedJWT.getJWTClaimsSet().getIssueTime().toInstant()
                .plus(REFRESHABLE_DURATION, ChronoUnit.SECONDS))
                : signedJWT.getJWTClaimsSet().getExpirationTime();
        if (!expirationTime.after(new Date())) {
            throw new AppException(ErrorCode.TOKEN_EXPIRED);
        }

        // Check token có trùng trong Redis không
        String accountId = signedJWT.getJWTClaimsSet().getSubject();
        String redisKey = "account:" + accountId + ":token";
        String currentToken = redisTemplate.opsForValue().get(redisKey);

        if (currentToken == null || !currentToken.equals(token)) {
            throw new AppException(ErrorCode.TOKEN_LOGGED_OUT);
        }

        return signedJWT;
    }
}