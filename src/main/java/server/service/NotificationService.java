package server.service;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import server.dto.response.PageResponse;
import server.dto.response.notification.NotificationResponse;
import server.entity.Account;
import server.entity.Notification;
import server.exception.AppException;
import server.exception.ErrorCode;
import server.mapper.NotificationMapper;
import server.mapper.PageMapper;
import server.repository.AccountRepository;
import server.repository.NotificationRepository;

import java.util.*;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class NotificationService {
    NotificationRepository notificationRepository;
    AccountRepository accountRepository;

    NotificationMapper notificationMapper;
    PageMapper pageMapper;

    public PageResponse<NotificationResponse> getMyNotifications(int page, int size, String sortBy) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(sortBy).descending());
        SecurityContext context = SecurityContextHolder.getContext();
        String accountId = Objects.requireNonNull(context.getAuthentication()).getName();

        Account account = accountRepository.findById(accountId)
                .orElseThrow(() -> new AppException(ErrorCode.ACCOUNT_NOT_EXISTED));

        Page<NotificationResponse> resultPage = notificationRepository
                .getNotificationByAccount(account, pageable)
                .map(notificationMapper::toNotificationResponse);

        return pageMapper.map(resultPage);
    }

    public NotificationResponse getMyNotification(String id) {
        SecurityContext context = SecurityContextHolder.getContext();
        String accountId = Objects.requireNonNull(context.getAuthentication()).getName();

        Account account = accountRepository.findById(accountId)
                .orElseThrow(() -> new AppException(ErrorCode.ACCOUNT_NOT_EXISTED));

        Notification notification = notificationRepository
                .findByNotificationIdAndAccount(id, account)
                .orElseThrow(() -> new AppException(ErrorCode.NOTIFICATION_NOT_EXISTED));

        notification.setRead(true);
        notificationRepository.save(notification);

        return notificationMapper.toNotificationResponse(notification);
    }
}
