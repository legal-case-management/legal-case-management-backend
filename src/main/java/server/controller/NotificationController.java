package server.controller;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import server.dto.response.ApiResponse;
import server.dto.response.PageResponse;
import server.dto.response.notification.NotificationResponse;
import server.service.NotificationService;

@RestController
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequestMapping("/notification")
@Slf4j
public class NotificationController {
    NotificationService notificationService;

    @GetMapping("/my-notifications")
    public ApiResponse<PageResponse<NotificationResponse>> getMyNotifications(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "createdAt") String sortBy
    ) {
        return ApiResponse.<PageResponse<NotificationResponse>>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(notificationService.getMyNotifications(page, size, sortBy))
                .build();
    }
}
