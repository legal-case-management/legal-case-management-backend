package kds.controller;

import kds.dto.request.IntrospectRequest;
import kds.dto.request.authentication.JudgeCreateRequest;
import kds.dto.request.authentication.LoginRequest;
import kds.dto.request.authentication.LogoutRequest;
import kds.dto.request.authentication.RefreshTokenRequest;
import kds.dto.response.ApiResponse;
import kds.dto.response.authentication.AuthenticationResponse;
import kds.service.AuthenticationService;
import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("auth")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@Slf4j
public class AuthenticationController {
    AuthenticationService authenticationService;
    @PostMapping("/judge")
    public ApiResponse<Void> createCustomer(@RequestBody @Valid JudgeCreateRequest request){
        authenticationService.judgeRegister(request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Thêm thẩm phán thành công")
                .build();
    }

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

    @PostMapping("introspect")
    public ApiResponse<Void> introspect(@RequestBody IntrospectRequest request) {
        authenticationService.introspect(request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Token valid")
                .build();
    }

    @PostMapping("logout")
    public ApiResponse<Void> logout(@RequestBody LogoutRequest request) {
        authenticationService.logout(request);

        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Logout successful")
                .build();
    }

    @PostMapping("refresh-token")
    public ApiResponse<AuthenticationResponse> refreshToken(@RequestBody RefreshTokenRequest request) {
        return ApiResponse.<AuthenticationResponse>builder()
                .data(authenticationService.refreshToken(request))
                .success(true)
                .status(200)
                .message("Logout successful")
                .build();
    }
}
