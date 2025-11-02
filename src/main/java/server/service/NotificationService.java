package server.service;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import server.dto.response.PageResponse;
import server.dto.response.notification.NotificationResponse;
import server.entity.Account;
import server.entity.LegalCase;
import server.entity.Litigant;
import server.entity.Notification;
import server.entity.enums.NotificationType;
import server.exception.AppException;
import server.exception.ErrorCode;
import server.mapper.NotificationMapper;
import server.mapper.PageMapper;
import server.repository.AccountRepository;
import server.repository.LegalCaseRepository;
import server.repository.NotificationRepository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.*;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class NotificationService {
    NotificationRepository notificationRepository;
    AccountRepository accountRepository;
    LegalCaseRepository legalCaseRepository;

    NotificationMapper notificationMapper;
    PageMapper pageMapper;

    public PageResponse<NotificationResponse> getMyNotifications(int page, int size, String sortBy) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(sortBy).descending());
        SecurityContext context = SecurityContextHolder.getContext();
        String accountId = context.getAuthentication().getName();

        Account account = accountRepository.findById(accountId)
                .orElseThrow(() -> new AppException(ErrorCode.ACCOUNT_NOT_EXISTED));

        Page<NotificationResponse> resultPage = notificationRepository
                .getNotificationByAccount(account, pageable)
                .map(notificationMapper::toNotificationResponse);

        return pageMapper.map(resultPage);
    }

    public NotificationResponse getMyNotification(String id) {
        SecurityContext context = SecurityContextHolder.getContext();
        String accountId = context.getAuthentication().getName();

        Account account = accountRepository.findById(accountId)
                .orElseThrow(() -> new AppException(ErrorCode.ACCOUNT_NOT_EXISTED));

        Notification notification = notificationRepository
                .findByNotificationIdAndAccount(id, account)
                .orElseThrow(() -> new AppException(ErrorCode.NOTIFICATION_NOT_EXISTED));

        notification.setRead(true);
        notificationRepository.save(notification);

        return notificationMapper.toNotificationResponse(notification);
    }

    @Scheduled(cron = "0 0 0 * * *", zone = "Asia/Ho_Chi_Minh")
    @Transactional
    public void notifyExpiringCases() {
        LocalDate now = LocalDate.now();
        int daysBeforeExpire = 7;
        LocalDate futureDate = now.plusDays(daysBeforeExpire);

        List<LegalCase> expiringCases =
                legalCaseRepository.findCasesExpiringWithinDays(now, futureDate);

        for (LegalCase lc : expiringCases) {
            if (lc.getJudge() == null || lc.getJudge().getAccount() == null) continue;

            long daysLeft = ChronoUnit.DAYS.between(now, lc.getExpiredDate());
            String title = "Vụ án sắp hết hạn";

            List<Litigant> sortedLitigants = lc.getLitigants().stream()
                    .sorted(Comparator
                            .comparing((Litigant l) -> l.getLitigantType().ordinal())
                            .thenComparing(Litigant::getOrdinal))
                    .toList();

            Map<String, List<String>> groupedLitigants = sortedLitigants.stream()
                    .collect(Collectors.groupingBy(
                            l -> l.getLitigantType().getName(),
                            LinkedHashMap::new,
                            Collectors.mapping(Litigant::getName, Collectors.toList())
                    ));

            String litigantsInfo = groupedLitigants.entrySet().stream()
                    .map(entry -> String.format("%s:\n%s",
                            entry.getKey(),
                            entry.getValue().stream()
                                    .map(name -> "- " + name)
                                    .collect(Collectors.joining("\n"))
                    ))
                    .collect(Collectors.joining("\n\n"));

            String relationshipName = lc.getLegalRelationship() != null
                    ? lc.getLegalRelationship().getLegalRelationshipName()
                    : "Không xác định";
            String acceptanceDate = lc.getAcceptanceDate() != null
                    ? lc.getAcceptanceDate().toString()
                    : "Không xác định";
            String expiredDate = lc.getExpiredDate() != null
                    ? lc.getExpiredDate().toString()
                    : "Không xác định";

            String content = String.format(
                    """
                    Vụ án %s có số thụ lý %s còn %d ngày nữa sẽ hết hạn.
    
                    • Quan hệ pháp luật: %s
                    • Ngày thụ lý: %s
                    • Ngày hết hạn: %s
    
                    Danh sách đương sự:
                    %s
                    """,
                    lc.getLegalCaseId(),
                    lc.getAcceptanceNumber(),
                    daysLeft,
                    relationshipName,
                    acceptanceDate,
                    expiredDate,
                    litigantsInfo
            );

            Notification notification = Notification.builder()
                    .notificationType(NotificationType.UPCOMING_DEADLINE)
                    .title(title)
                    .content(content)
                    .createdAt(LocalDateTime.now())
                    .isRead(false)
                    .account(lc.getJudge().getAccount())
                    .legalCase(lc)
                    .build();

            notificationRepository.save(notification);
        }

        System.out.println("Đã gửi thông báo sắp hết hạn (" + daysBeforeExpire + " ngày) lúc 0h00");
    }
}
