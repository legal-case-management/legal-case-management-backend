package server.service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import lombok.Synchronized;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;
import server.dto.request.authentication.*;
import server.dto.response.PageResponse;
import server.dto.response.authentication.AccountResponse;
import server.dto.response.authentication.AuthenticationResponse;
import server.dto.response.authentication.VerifyOtpResponse;
import server.entity.Account;
import server.exception.AppException;
import server.exception.ErrorCode;
import server.mapper.AccountMapper;
import server.mapper.PageMapper;
import server.repository.AccountRepository;
import com.nimbusds.jose.*;
import com.nimbusds.jose.crypto.MACSigner;
import com.nimbusds.jose.crypto.MACVerifier;
import com.nimbusds.jwt.JWTClaimsSet;
import com.nimbusds.jwt.SignedJWT;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.experimental.NonFinal;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import server.repository.JudgeRepository;

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
    @Value("${jwt.reset-password-duration}")
    long RESET_PASSWORD_DURATION;

    @NonFinal
    @Value("${jwt.refreshable-duration}")
    long REFRESHABLE_DURATION;

    @Value("${auth.default-password}")
    @NonFinal
    String DEFAULT_PASSWORD;

    RedisTemplate<String, String> tokenRedis;
    RedisTemplate<String, String> otpRedis;
    AccountRepository accountRepository;

    AccountMapper accountMapper;
    PageMapper pageMapper;

    PasswordEncoder passwordEncoder;

    JavaMailSender mailSender;
    JudgeRepository judgeRepository;

    public AuthenticationResponse login(LoginRequest request) {
        /* 1. Find account in database*/
        String identifier = request.getIdentifier();
        String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";

        Account account = identifier.matches(emailRegex)
                ? accountRepository.findAccountByEmail(identifier)
                .orElseThrow(() -> new AppException(ErrorCode.ACCOUNT_NOT_EXISTED))
                : accountRepository.findAccountByUsername(identifier)
                .orElseThrow(() -> new AppException(ErrorCode.ACCOUNT_NOT_EXISTED));

        if (!account.isActive())
            throw new AppException(ErrorCode.ACCOUNT_BLOCKED);

        /* 2. Check password*/
        boolean authenticated = passwordEncoder.matches(request.getPassword(), account.getPassword());
        if (!authenticated)
            throw new AppException(ErrorCode.INVALID_PASSWORD);

        try {
            // 3. Generate new token
            String token = generateToken(account, false);

            // 4. Xóa token cũ trong Redis (nếu có)
            String redisKey = "account:" + account.getAccountId() + ":token";
            tokenRedis.delete(redisKey);

            // 5. Lưu token mới vào Redis với TTL
            tokenRedis.opsForValue().set(redisKey, token, VALID_DURATION, TimeUnit.SECONDS);

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
            tokenRedis.delete(redisKey);
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
            String token = generateToken(account, false);

            // Update Redis
            String redisKey = "account:" + account.getAccountId() + ":token";
            tokenRedis.opsForValue().set(redisKey, token, VALID_DURATION, TimeUnit.SECONDS);

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
        String accountId = Objects.requireNonNull(SecurityContextHolder.getContext().getAuthentication()).getName();

        // Tìm account trong database
        Account account = accountRepository.findById(accountId)
                .orElseThrow(() -> new AppException(ErrorCode.ACCOUNT_NOT_EXISTED));

        if (!request.getNewPassword().equals(request.getConfirmNewPassword()))
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
    public void createAccount(AccountRequest request) {
        createAccount(accountMapper.toAccount(request));
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void updateAccount(String id, AccountRequest request) {
        Account account = accountRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.ACCOUNT_NOT_EXISTED));

        if (!account.getUsername().equals(request.getUsername())
                && accountRepository.existsByUsername(request.getUsername()))
            throw new AppException(ErrorCode.USERNAME_EXISTED);

        if (!account.getEmail().equals(request.getEmail())
                && accountRepository.existsByEmail(request.getEmail()))
            throw new AppException(ErrorCode.EMAIL_EXISTED);



        accountMapper.toAccount(request, account);
        accountRepository.save(account);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void deleteAccount(String id) {
        Account account = accountRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.ACCOUNT_NOT_EXISTED));

        accountRepository.delete(account);
    }

    public void createAccount(Account account) {
        if (accountRepository.existsByUsername(account.getUsername())) {
            throw new AppException(ErrorCode.USERNAME_EXISTED);
        }

        if (accountRepository.existsByEmail(account.getEmail())) {
            throw new AppException(ErrorCode.EMAIL_EXISTED);
        }

        account.setPassword(passwordEncoder.encode(DEFAULT_PASSWORD));
        account.setActive(true);
        accountRepository.save(account);
    }

    private String generateToken(Account account, boolean isForgotPassword) throws JOSEException {
        JWSHeader header = new JWSHeader(JWSAlgorithm.HS256);
        JWTClaimsSet claims = new JWTClaimsSet.Builder()
                .jwtID(UUID.randomUUID().toString())
                .subject(account.getAccountId())
                .issuer("legal-case-management")
                .issueTime(new Date())
                .expirationTime(isForgotPassword ?
                        new Date(Instant.now().plus(RESET_PASSWORD_DURATION, ChronoUnit.SECONDS).toEpochMilli())
                        : new Date(Instant.now().plus(VALID_DURATION, ChronoUnit.SECONDS).toEpochMilli()))
                .claim("username", account.getUsername())
                .claim("displayName", account.getOfficer() != null
                        ? account.getOfficer().getFullName()
                        : null)
                .claim("officerId", account.getOfficer() != null ? account.getOfficer().getOfficerId() : null)
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
        String currentToken = tokenRedis.opsForValue().get(redisKey);

        if (currentToken == null || !currentToken.equals(token)) {
            throw new AppException(ErrorCode.TOKEN_LOGGED_OUT);
        }

        return signedJWT;
    }

    public void forgotPassword(ForgotPasswordRequest request) {
        Account account = accountRepository.findAccountByEmail(request.getEmail())
                .orElseThrow(() -> new AppException(ErrorCode.ACCOUNT_NOT_EXISTED));
        boolean existedOtp = otpRedis.hasKey("otp:" + account.getEmail());
        if(existedOtp)
            throw new AppException(ErrorCode.OTP_SENT);
        try {
            sendOtpEmail(account.getEmail());
        } catch (MessagingException e) {
            throw new AppException(ErrorCode.SEND_EMAIL_FAILED);
        }
    }

    public VerifyOtpResponse verifyOtp(VerifyOtpRequest request) {
        Account account = accountRepository.findAccountByEmail(request.getEmail())
                .orElseThrow(() -> new AppException(ErrorCode.ACCOUNT_NOT_EXISTED));

        String savedOtp = otpRedis.opsForValue().get("otp:" + account.getEmail());
        if (savedOtp == null)
            throw new AppException(ErrorCode.OTP_EXPIRED);

        if (!savedOtp.equals(request.getOtp()))
            throw new AppException(ErrorCode.OTP_INVALID);

        try {
            // Xóa OTP sau khi xác thực thành công
            otpRedis.delete("otp:" + account.getEmail());
            String token = generateToken(account, true);
            return VerifyOtpResponse.builder()
                    .verified(true)
                    .token(token)
                    .build();
        } catch (JOSEException e) {
            throw new AppException(ErrorCode.VERIFY_OTP_FAILED);
        }
    }

    public void resetPassword(ResetPasswordRequest request) {
        String accountId = Objects.requireNonNull(SecurityContextHolder.getContext().getAuthentication()).getName();
        Account account = accountRepository.findById(accountId)
                .orElseThrow(() -> new AppException(ErrorCode.ACCOUNT_NOT_EXISTED));

        if (!request.getNewPassword().equals(request.getConfirmNewPassword()))
            throw new AppException(ErrorCode.NEW_PASSWORD_NOT_MATCH);

        account.setPassword(passwordEncoder.encode(request.getNewPassword()));
        accountRepository.save(account);

        tokenRedis.delete("account:" + account.getAccountId() + ":token");
    }

    public void sendOtpEmail(String toEmail) throws MessagingException {
        String otp = generateOtp();

        otpRedis.opsForValue().set("otp:" + toEmail, otp, 2, TimeUnit.MINUTES);

        String subject = "Mã OTP đặt lại mật khẩu";
        String content = "<p>Xin chào,</p>"
                + "<p>Mã OTP của bạn là: <b>" + otp + "</b></p>"
                + "<p>OTP sẽ hết hạn sau <b>2 phút</b>. Vui lòng không chia sẻ mã này với bất kỳ ai.</p>";

        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
        helper.setTo(toEmail);
        helper.setSubject(subject);
        helper.setText(content, true);
        mailSender.send(message);
    }

    public String generateOtp() {
        Random random = new Random();
        int otp = 100000 + random.nextInt(900000);
        return String.valueOf(otp);
    }

    public AccountResponse getMyInfo() {
        SecurityContext context = SecurityContextHolder.getContext();
        String accountId = Objects.requireNonNull(context.getAuthentication()).getName();
        return accountMapper.toAccountResponse(
                accountRepository
                        .findById(accountId)
                        .orElseThrow(() -> new AppException(ErrorCode.ACCOUNT_NOT_EXISTED))
        );
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    public List<AccountResponse> getAllAccount() {
        return accountRepository.findAll()
                .stream().map(accountMapper::toAccountResponse)
                .toList();
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    public PageResponse<AccountResponse> search(AccountSearchRequest request, int page, int size, String sortBy) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(sortBy).ascending());
        Page<AccountResponse> resultPage = accountRepository.search(
                request.getUsername(),
                request.getEmail(),
                request.getRole(),
                request.getFullName(),
                pageable
        ).map(accountMapper::toAccountResponse);

        return pageMapper.map(resultPage);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    public void blockAccount(String id) {
        Account account = accountRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.ACCOUNT_NOT_EXISTED));

        account.setActive(false);
        accountRepository.save(account);

        tokenRedis.delete("account:" + account.getAccountId() + ":token");
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    public void activeAccount(String id) {
        Account account = accountRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.ACCOUNT_NOT_EXISTED));
        account.setActive(true);
        accountRepository.save(account);
    }

//    @Scheduled(cron = "0 */6 * * * *")
//    public void keepServerAwake() {
//        try {
//            RestTemplate restTemplate = new RestTemplate();
//            String url = "https://legal-case-management-backend-sggy.onrender.com/auth/ping";
//            restTemplate.getForObject(url, String.class);
//        } catch (Exception e) {
//            System.out.println(e.getMessage());
//        }
//    }
}