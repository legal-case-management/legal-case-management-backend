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
import server.entity.Notification;
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
import java.util.List;

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

    @Scheduled(cron = "0 0 0 * * *", zone = "Asia/Ho_Chi_Minh")
    @Transactional
    public void notifyExpiringCases() {
        LocalDate now = LocalDate.now();
        int daysBeforeExpire = 7; // <-- tham số có thể đổi dễ dàng
        LocalDate futureDate = now.plusDays(daysBeforeExpire);

        List<LegalCase> expiringCases =
                legalCaseRepository.findCasesExpiringWithinDays(now, futureDate);

        for (LegalCase lc : expiringCases) {
            if (lc.getJudge() == null || lc.getJudge().getAccount() == null) continue;

            long daysLeft = ChronoUnit.DAYS.between(now, lc.getExpiredDate());
            String title = "Vụ án sắp hết hạn";
            String content = String.format(
                    "Vụ án %s có số thụ lý %s còn %d ngày nữa sẽ hết hạn.",
                    lc.getLegalCaseId(),
                    lc.getAcceptanceNumber(),
                    daysLeft
            );

            if (!notificationRepository.existsByLegalCaseAndAccountAndTitle(lc, lc.getJudge().getAccount(), title)) {
                Notification notification = Notification.builder()
                        .title(title)
                        .content(content)
                        .createdAt(LocalDateTime.now())
                        .isRead(false)
                        .account(lc.getJudge().getAccount())
                        .legalCase(lc)
                        .build();

                notificationRepository.save(notification);
            }
        }

        System.out.println("✅ Đã gửi thông báo sắp hết hạn (" + daysBeforeExpire + " ngày) lúc 0h00");
    }
}
