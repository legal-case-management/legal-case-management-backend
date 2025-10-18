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
import server.dto.response.legalCase.LegalCaseResponse;
import server.dto.response.notification.NotificationResponse;
import server.entity.Account;
import server.exception.AppException;
import server.exception.ErrorCode;
import server.mapper.NotificationMapper;
import server.repository.AccountRepository;
import server.repository.NotificationRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class NotificationService {
    NotificationRepository notificationRepository;
    AccountRepository accountRepository;

    NotificationMapper notificationMapper;

    public PageResponse<NotificationResponse> getMyNotifications(int page, int size, String sortBy) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(sortBy).descending());
        SecurityContext context = SecurityContextHolder.getContext();
        String accountId = context.getAuthentication().getName();

        Account account = accountRepository.findById(accountId)
                .orElseThrow(() -> new AppException(ErrorCode.ACCOUNT_NOT_EXISTED));

        Page<NotificationResponse> resultPage = notificationRepository
                .getNotificationByAccount(account, pageable)
                .map(notificationMapper::toNotificationResponse);

        return PageResponse.<NotificationResponse>builder()
                .number(resultPage.getNumber())
                .size(resultPage.getSize())
                .numberOfElement(resultPage.getNumberOfElements())
                .totalElements(resultPage.getTotalElements())
                .totalPages(resultPage.getTotalPages())
                .hasNext(resultPage.hasNext())
                .hasPrevious(resultPage.hasPrevious())
                .isFirst(resultPage.isFirst())
                .isLast(resultPage.isLast())
                .content(resultPage.getContent())
                .build();
    }
}
