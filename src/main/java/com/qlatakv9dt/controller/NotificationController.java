package com.qlatakv9dt.controller;

import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import com.qlatakv9dt.dto.request.notification.MarkAsReadRequest;
import com.qlatakv9dt.dto.response.ApiResponse;
import com.qlatakv9dt.dto.response.PageResponse;
import com.qlatakv9dt.dto.response.notification.NotificationResponse;
import com.qlatakv9dt.service.NotificationService;

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
            @RequestParam(defaultValue = "storageDate") String sortBy
    ) {
        return ApiResponse.<PageResponse<NotificationResponse>>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(notificationService.getMyNotifications(page, size, sortBy))
                .build();
    }

    @GetMapping("/my-notifications/{id}")
    public ApiResponse<NotificationResponse> getMyNotification(@PathVariable String id) {
        return ApiResponse.<NotificationResponse>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(notificationService.getMyNotification(id))
                .build();
    }

    @GetMapping("/unread-count")
    public ApiResponse<Long> getUnreadCount() {
        return ApiResponse.<Long>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(notificationService.getMyUnreadCount())
                .build();
    }

    @PostMapping("/mark-as-read")
    public ApiResponse<Void> markAsRead(@RequestBody @Valid MarkAsReadRequest request) {
        notificationService.markAsRead(request.getNotificationIds());
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Đã đánh dấu đã đọc")
                .build();
    }

    @PostMapping("/mark-all-as-read")
    public ApiResponse<Void> markAllAsRead() {
        notificationService.markAllAsRead();
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Đã đánh dấu tất cả đã đọc")
                .build();
    }
}
