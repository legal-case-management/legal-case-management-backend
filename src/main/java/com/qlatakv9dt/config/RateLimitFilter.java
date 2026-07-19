package com.qlatakv9dt.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.qlatakv9dt.dto.response.ApiResponse;
import com.qlatakv9dt.exception.ErrorCode;
import com.qlatakv9dt.service.RateLimiterService;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.MediaType;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.time.Duration;
import java.util.Map;

/**
 * Rate limit dựa trên Redis (fixed window theo IP), chạy trước filter chain của Spring Security.
 * Áp 2 tầng: giới hạn chung cho mọi API, và giới hạn chặt hơn riêng cho các endpoint auth dễ bị brute-force
 * (login, forgot-password, verify-otp, reset-password).
 * Không đánh dấu @Component: filter được add thủ công vào SecurityFilterChain (xem SecurityConfig) —
 * nếu để Spring Boot tự động đăng ký thêm 1 lần nữa vào servlet container, request sẽ bị đếm rate limit 2 lần.
 */
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class RateLimitFilter extends OncePerRequestFilter {
    RateLimiterService rateLimiterService;

    static final Map<String, Integer> SENSITIVE_AUTH_ENDPOINTS = Map.of(
            "/auth/login", 10,
            "/auth/forgot-password", 5,
            "/auth/verify-otp", 10,
            "/auth/reset-password", 10
    );
    static final Duration SENSITIVE_WINDOW = Duration.ofMinutes(1);

    int defaultLimit;
    long defaultWindowSeconds;

    @Override
    protected void doFilterInternal(
            HttpServletRequest request,
            HttpServletResponse response,
            FilterChain filterChain
    ) throws ServletException, IOException {
        String clientIp = resolveClientIp(request);
        String path = request.getRequestURI();

        Integer sensitiveLimit = SENSITIVE_AUTH_ENDPOINTS.get(path);
        boolean allowed;
        if (sensitiveLimit != null) {
            allowed = rateLimiterService.tryAcquire(
                    "rate-limit:sensitive:" + path + ":" + clientIp,
                    sensitiveLimit,
                    SENSITIVE_WINDOW
            );
        } else {
            allowed = rateLimiterService.tryAcquire(
                    "rate-limit:default:" + clientIp,
                    defaultLimit,
                    Duration.ofSeconds(defaultWindowSeconds)
            );
        }

        if (!allowed) {
            writeTooManyRequests(response);
            return;
        }

        filterChain.doFilter(request, response);
    }

    /** Ưu tiên X-Forwarded-For (client thật đứng sau reverse proxy/load balancer), fallback về remote address. */
    private String resolveClientIp(HttpServletRequest request) {
        String forwardedFor = request.getHeader("X-Forwarded-For");
        if (forwardedFor != null && !forwardedFor.isBlank()) {
            return forwardedFor.split(",")[0].trim();
        }
        return request.getRemoteAddr();
    }

    private void writeTooManyRequests(HttpServletResponse response) throws IOException {
        ErrorCode errorCode = ErrorCode.TOO_MANY_REQUESTS;
        response.setStatus(errorCode.getHttpStatus().value());
        response.setContentType(MediaType.APPLICATION_JSON_VALUE);

        ApiResponse<?> apiResponse = ApiResponse
                .builder()
                .success(false)
                .status(errorCode.getStatus())
                .error(errorCode.getMessage())
                .build();

        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.registerModule(new JavaTimeModule());
        response.getWriter().write(objectMapper.writeValueAsString(apiResponse));
        response.flushBuffer();
    }
}
