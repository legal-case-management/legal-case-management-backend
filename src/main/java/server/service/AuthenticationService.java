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
import org.springframework.security.core.Authentication;
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
import server.entity.Permission;
import server.entity.Role;
import server.exception.AppException;
import server.exception.ErrorCode;
import server.mapper.AccountMapper;
import server.mapper.PageMapper;
import server.repository.AccountRepository;
import server.repository.RoleRepository;
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
    RoleRepository roleRepository;

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
            // 3. Sinh cặp token mới: accessToken (ngắn hạn) + refreshToken (dài hạn)
            String accessToken = generateAccessToken(account);
            String refreshToken = generateRefreshToken(account);

            // 4. Xóa token cũ trong Redis (nếu có) rồi lưu cặp token mới với TTL tương ứng
            String accountId = account.getAccountId();
            tokenRedis.delete(accessKey(accountId));
            tokenRedis.delete(refreshKey(accountId));
            tokenRedis.opsForValue().set(accessKey(accountId), accessToken, VALID_DURATION, TimeUnit.SECONDS);
            tokenRedis.opsForValue().set(refreshKey(accountId), refreshToken, REFRESHABLE_DURATION, TimeUnit.SECONDS);

            // 5. Trả về cả 2 token (token = accessToken để tương thích ngược)
            return AuthenticationResponse.builder()
                    .authenticated(true)
                    .accessToken(accessToken)
                    .refreshToken(refreshToken)
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
            /* Parse token để lấy accountId (không bắt buộc còn hạn vì mục đích là hủy phiên) */
            SignedJWT signedJWT = SignedJWT.parse(request.getToken());
            String accountId = signedJWT.getJWTClaimsSet().getSubject();

            /* Xóa cả access token và refresh token khỏi Redis -> hủy phiên hoàn toàn */
            tokenRedis.delete(accessKey(accountId));
            tokenRedis.delete(refreshKey(accountId));
        } catch (ParseException e) {
            throw new AppException(ErrorCode.LOGOUT_FAILED);
        }
    }

    public AuthenticationResponse refreshToken(RefreshTokenRequest request) {
        try {
            // Xác thực refreshToken theo đúng bản đang lưu ở Redis (:refreshToken)
            SignedJWT signedJWT = verifyRefreshToken(request.resolveRefreshToken());
            String accountId = signedJWT.getJWTClaimsSet().getSubject();

            // Check account exists
            Account account = accountRepository.findById(accountId)
                    .orElseThrow(() -> new AppException(ErrorCode.ACCOUNT_NOT_EXISTED));

            // Cấp access token mới và xoay vòng refresh token (an toàn hơn)
            String newAccessToken = generateAccessToken(account);
            String newRefreshToken = generateRefreshToken(account);

            tokenRedis.opsForValue().set(accessKey(accountId), newAccessToken, VALID_DURATION, TimeUnit.SECONDS);
            tokenRedis.opsForValue().set(refreshKey(accountId), newRefreshToken, REFRESHABLE_DURATION, TimeUnit.SECONDS);

            return AuthenticationResponse.builder()
                    .authenticated(true)
                    .accessToken(newAccessToken)
                    .refreshToken(newRefreshToken)
                    .build();
        } catch (AppException e) {
            throw e;
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


    @PreAuthorize("hasAuthority('CREATE_ACCOUNT')")
    @Async
    @Synchronized
    @Transactional
    public void createAccount(AccountRequest request) {
        Account account = accountMapper.toAccount(request);
        account.setRole(resolveRole(request.getRoleId()));
        createAccount(account);
    }

    @PreAuthorize("hasAuthority('UPDATE_ACCOUNT')")
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
        if (request.getRoleId() != null) {
            account.setRole(resolveRole(request.getRoleId()));
        }
        accountRepository.save(account);
    }

    @PreAuthorize("hasAuthority('DELETE_ACCOUNT')")
    @Async
    @Synchronized
    @Transactional
    public void deleteAccount(String id) {
        Account account = accountRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.ACCOUNT_NOT_EXISTED));

        accountRepository.delete(account);
    }

    /** Nạp Role entity từ roleId; ném 404 nếu vai trò không tồn tại. */
    private Role resolveRole(String roleId) {
        if (roleId == null) {
            throw new AppException(ErrorCode.ROLE_NOT_EXISTED);
        }
        return roleRepository.findById(roleId)
                .orElseThrow(() -> new AppException(ErrorCode.ROLE_NOT_EXISTED));
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
        // Token đặt lại mật khẩu vẫn dùng hàm này; access token thường dùng generateAccessToken().
        return buildToken(account, isForgotPassword ? RESET_PASSWORD_DURATION : VALID_DURATION,
                isForgotPassword ? "reset" : "access");
    }

    /** Access token: ngắn hạn, mang đầy đủ claims để Spring Security phân quyền. */
    private String generateAccessToken(Account account) throws JOSEException {
        return buildToken(account, VALID_DURATION, "access");
    }

    /** Refresh token: dài hạn, chỉ dùng để xin access token mới. */
    private String generateRefreshToken(Account account) throws JOSEException {
        return buildToken(account, REFRESHABLE_DURATION, "refresh");
    }

    private String buildToken(Account account, long durationSeconds, String tokenType) throws JOSEException {
        JWSHeader header = new JWSHeader(JWSAlgorithm.HS256);
        JWTClaimsSet claims = new JWTClaimsSet.Builder()
                .jwtID(UUID.randomUUID().toString())
                .subject(account.getAccountId())
                .issuer("legal-case-management")
                .issueTime(new Date())
                .expirationTime(new Date(Instant.now().plus(durationSeconds, ChronoUnit.SECONDS).toEpochMilli()))
                .claim("tokenType", tokenType)
                .claim("username", account.getUsername())
                .claim("displayName", account.getOfficer() != null
                        ? account.getOfficer().getFullName()
                        : null)
                .claim("officerId", account.getOfficer() != null ? account.getOfficer().getOfficerId() : null)
                // scope CHỈ chứa danh sách permissionId (không chứa roleId) -> Spring Security phân quyền.
                .claim("scope", buildScope(account))
                // roleName chỉ dùng để hiển thị ở giao diện, KHÔNG dùng cho phân quyền.
                .claim("roleName", account.getRole() != null ? account.getRole().getName() : null)
                .build();

        JWSObject jwsObject = new JWSObject(header, new Payload(claims.toJSONObject()));
        jwsObject.sign(new MACSigner(SIGNER_KEY.getBytes()));

        return jwsObject.serialize();
    }

    /** Tạo chuỗi scope = các permissionId của vai trò, ngăn cách bằng khoảng trắng. */
    private String buildScope(Account account) {
        Role role = account.getRole();
        if (role == null || role.getPermissions() == null || role.getPermissions().isEmpty()) {
            return "";
        }
        return role.getPermissions().stream()
                .map(Permission::getPermissionId)
                .collect(java.util.stream.Collectors.joining(" "));
    }

    private String accessKey(String accountId) {
        return "account:" + accountId + ":token";
    }

    private String refreshKey(String accountId) {
        return "account:" + accountId + ":refreshToken";
    }

    /** Xác thực access token (dùng cho introspect): so khớp với :token trong Redis. */
    private SignedJWT verifyToken(String token, boolean isRefresh) throws JOSEException, ParseException {
        SignedJWT signedJWT = parseAndVerifySignature(token);

        if (!signedJWT.getJWTClaimsSet().getExpirationTime().after(new Date())) {
            throw new AppException(ErrorCode.TOKEN_EXPIRED);
        }

        String accountId = signedJWT.getJWTClaimsSet().getSubject();
        String currentToken = tokenRedis.opsForValue().get(accessKey(accountId));
        if (currentToken == null || !currentToken.equals(token)) {
            throw new AppException(ErrorCode.TOKEN_LOGGED_OUT);
        }

        return signedJWT;
    }

    /** Xác thực refresh token: kiểm tra chữ ký, hạn, loại token và so khớp với :refreshToken trong Redis. */
    private SignedJWT verifyRefreshToken(String refreshToken) throws JOSEException, ParseException {
        if (refreshToken == null || refreshToken.isBlank()) {
            throw new AppException(ErrorCode.TOKEN_INVALID);
        }

        SignedJWT signedJWT = parseAndVerifySignature(refreshToken);
        JWTClaimsSet claims = signedJWT.getJWTClaimsSet();

        if (!"refresh".equals(claims.getStringClaim("tokenType"))) {
            throw new AppException(ErrorCode.TOKEN_INVALID);
        }

        if (claims.getExpirationTime() == null || !claims.getExpirationTime().after(new Date())) {
            throw new AppException(ErrorCode.TOKEN_EXPIRED);
        }

        String accountId = claims.getSubject();
        String currentRefresh = tokenRedis.opsForValue().get(refreshKey(accountId));
        if (currentRefresh == null || !currentRefresh.equals(refreshToken)) {
            throw new AppException(ErrorCode.TOKEN_LOGGED_OUT);
        }

        return signedJWT;
    }

    private SignedJWT parseAndVerifySignature(String token) throws JOSEException, ParseException {
        JWSVerifier verifier = new MACVerifier(SIGNER_KEY.getBytes());
        SignedJWT signedJWT = SignedJWT.parse(token);
        if (!signedJWT.verify(verifier)) {
            throw new AppException(ErrorCode.TOKEN_INVALID);
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

        tokenRedis.delete(accessKey(account.getAccountId()));
        tokenRedis.delete(refreshKey(account.getAccountId()));
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

    @PreAuthorize("hasAuthority('VIEW_ACCOUNT')")
    public List<AccountResponse> getAllAccount() {
        return accountRepository.findAll()
                .stream().map(accountMapper::toAccountResponse)
                .toList();
    }

    @PreAuthorize("hasAuthority('VIEW_ACCOUNT')")
    public PageResponse<AccountResponse> search(AccountSearchRequest request, int page, int size, String sortBy) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(sortBy).ascending());
        Page<AccountResponse> resultPage = accountRepository.search(
                request.getUsername(),
                request.getEmail(),
                request.getRoleId(),
                request.getFullName(),
                pageable
        ).map(accountMapper::toAccountResponse);

        return pageMapper.map(resultPage);
    }

    @PreAuthorize("hasAuthority('BLOCK_ACCOUNT')")
    public void blockAccount(String id) {
        Account account = accountRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.ACCOUNT_NOT_EXISTED));

        account.setActive(false);
        accountRepository.save(account);

        tokenRedis.delete(accessKey(account.getAccountId()));
        tokenRedis.delete(refreshKey(account.getAccountId()));
    }

    @PreAuthorize("hasAuthority('BLOCK_ACCOUNT')")
    public void activeAccount(String id) {
        Account account = accountRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.ACCOUNT_NOT_EXISTED));
        account.setActive(true);
        accountRepository.save(account);
    }

    /**
     * Lấy tài khoản đang đăng nhập, trả về null nếu không xác định được
     * (ví dụ tiến trình chạy nền không có SecurityContext).
     */
    public Account getCurrentAccount() {
        SecurityContext context = SecurityContextHolder.getContext();
        String accountId = Objects.requireNonNull(context.getAuthentication()).getName();
        return accountRepository.findById(accountId)
                .orElseThrow(() -> new AppException(ErrorCode.ACCOUNT_NOT_EXISTED));
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