package com.qlatakv9dt.controller;

import com.qlatakv9dt.dto.request.authentication.*;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import com.qlatakv9dt.dto.request.authentication.*;
import com.qlatakv9dt.dto.response.ApiResponse;
import com.qlatakv9dt.dto.response.PageResponse;
import com.qlatakv9dt.dto.response.authentication.AccountResponse;
import com.qlatakv9dt.dto.response.authentication.AuthenticationResponse;
import com.qlatakv9dt.dto.response.authentication.VerifyOtpResponse;
import com.qlatakv9dt.service.AuthenticationService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/auth")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@Slf4j
public class AuthenticationController {
    AuthenticationService authenticationService;

    @PostMapping("/login")
    public ApiResponse<AuthenticationResponse> login(@RequestBody LoginRequest request) {
        AuthenticationResponse authenticationResponse = authenticationService.login(request);
        return ApiResponse.<AuthenticationResponse>builder()
                .data(authenticationResponse)
                .success(true)
                .status(200)
                .message("Đăng nhập thành công")
                .build();
    }

    @PostMapping("/introspect")
    public ApiResponse<Void> introspect(@RequestBody IntrospectRequest request) {
        authenticationService.introspect(request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Token hợp lệ")
                .build();
    }

    @PostMapping("/logout")
    public ApiResponse<Void> logout(@RequestBody LogoutRequest request) {
        authenticationService.logout(request);

        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Đăng xuất thành công")
                .build();
    }

    @PostMapping("/refresh-token")
    public ApiResponse<AuthenticationResponse> refreshToken(@RequestBody RefreshTokenRequest request) {
        return ApiResponse.<AuthenticationResponse>builder()
                .data(authenticationService.refreshToken(request))
                .success(true)
                .status(200)
                .message("Mở rộng phiên đăng nhập thành công")
                .build();
    }

    @PostMapping("/change-password")
    public ApiResponse<Void> refreshToken(@RequestBody ChangePasswordRequest request) {
        authenticationService.changePassword(request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Đổi mât khẩu thành công")
                .build();
    }

    @PostMapping("/forgot-password")
    public ApiResponse<Void> forgotPassword(@RequestBody ForgotPasswordRequest request) {
        authenticationService.forgotPassword(request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .build();
    }

    @PostMapping("/verify-otp")
    public ApiResponse<VerifyOtpResponse> verifyOtp(@RequestBody VerifyOtpRequest request) {
        return ApiResponse.<VerifyOtpResponse>builder()
                .data(authenticationService.verifyOtp(request))
                .success(true)
                .status(200)
                .message("Xác thực OTP thành công")
                .build();
    }

    @PostMapping("/reset-password")
    public ApiResponse<Void> resetPassword(@RequestBody ResetPasswordRequest request) {
        authenticationService.resetPassword(request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Đặt lại mật khẩu thành công")
                .build();
    }

    @PostMapping("/account")
    public ApiResponse<Void> createAccount(@RequestBody AccountRequest request) {
        authenticationService.createAccount(request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Tạo tài khoản thành công")
                .build();
    }

    @PutMapping("/account/{id}")
    public ApiResponse<Void> updateAccount(@PathVariable String id,@RequestBody AccountRequest request) {
        authenticationService.updateAccount(id, request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Chỉnh sửa tài khoản thành công")
                .build();
    }

    @DeleteMapping("/account/{id}")
    public ApiResponse<Void> deleteAccount(@PathVariable String id) {
        authenticationService.deleteAccount(id);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Xóa tài khoản thành công")
                .build();
    }

    @GetMapping("/account/all")
    public ApiResponse<List<AccountResponse>> getAllAccount() {
        return ApiResponse.<List<AccountResponse>>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(authenticationService.getAllAccount())
                .build();
    }

    @PostMapping("/account/search")
    public ApiResponse<PageResponse<AccountResponse>> search(
            @RequestBody @Valid AccountSearchRequest request,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "accountId") String sortBy
    ) {
        return ApiResponse.<PageResponse<AccountResponse>>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(authenticationService.search(request, page, size, sortBy))
                .build();
    }

    @GetMapping("/my-info")
    public ApiResponse<AccountResponse> getMyInfo(){
        return ApiResponse.<AccountResponse>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(authenticationService.getMyInfo())
                .build();
    }

    @PatchMapping("/account/block/{id}")
    public ApiResponse<Void> blockAccount(@PathVariable String id) {
        authenticationService.blockAccount(id);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .build();
    }

    @PatchMapping("/account/active/{id}")
    public ApiResponse<Void> activeAccount(@PathVariable String id) {
        authenticationService.activeAccount(id);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .build();
    }

    @GetMapping("/ping")
    public ResponseEntity<Void> ping() {
        return ResponseEntity.ok().build();
    }
}
