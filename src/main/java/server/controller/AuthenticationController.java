package server.controller;

import server.dto.request.authentication.*;
import server.dto.response.ApiResponse;
import server.dto.response.authentication.AuthenticationResponse;
import server.service.AuthenticationService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/auth")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@Slf4j
public class AuthenticationController {
    AuthenticationService authenticationService;

    @PostMapping("/login")
    public ApiResponse<AuthenticationResponse> customerLogin(@RequestBody LoginRequest request) {
        AuthenticationResponse authenticationResponse = authenticationService.login(request);
        return ApiResponse.<AuthenticationResponse>builder()
                .data(authenticationResponse)
                .success(true)
                .status(200)
                .message("Login successful")
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
}
