package server.service;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import server.entity.LegalCase;
import server.repository.LegalCaseRepository;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

/**
 * Tác vụ định kỳ tạo thông báo cho án sắp hết hạn và án quá hạn.
 * Chạy vào 6h sáng hằng ngày (giờ Việt Nam).
 */
@Component
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@Slf4j
public class NotificationScheduler {

    LegalCaseRepository legalCaseRepository;
    NotificationService notificationService;

    private static final long UPCOMING_THRESHOLD_DAYS = 7;
    private static final long OVERDUE_THRESHOLD_DAYS = 6;

    /**
     * 6h sáng hằng ngày: thông báo án sắp hết hạn (còn <= 7 ngày) và án quá hạn (0 -> 6 ngày).
     */
    @Scheduled(cron = "0 0 6 * * *", zone = "Asia/Ho_Chi_Minh")
    @Transactional
    public void sendDailyDeadlineNotifications() {
        sendUpcomingDeadlineNotifications();
        sendOverdueNotifications();
    }

    void sendUpcomingDeadlineNotifications() {
        LocalDate today = LocalDate.now();
        LocalDate futureDate = today.plusDays(UPCOMING_THRESHOLD_DAYS);

        List<LegalCase> cases = legalCaseRepository.findUpcomingDeadlineCases(today, futureDate);
        int count = 0;
        for (LegalCase legalCase : cases) {
            if (legalCase.getExpiredDate() == null) {
                continue;
            }
            long daysLeft = ChronoUnit.DAYS.between(today, legalCase.getExpiredDate());
            // Ngày hết hạn (daysLeft == 0) thuộc nhóm "quá hạn 0 ngày", không gửi ở đây.
            if (daysLeft < 1 || daysLeft > UPCOMING_THRESHOLD_DAYS) {
                continue;
            }
            try {
                notificationService.notifyUpcomingDeadline(legalCase, daysLeft);
                count++;
            } catch (Exception e) {
                log.warn("Lỗi gửi thông báo sắp hết hạn cho án {}: {}",
                        legalCase.getLegalCaseId(), e.getMessage());
            }
        }
        log.info("[NotificationScheduler] Đã gửi {} thông báo án sắp hết hạn.", count);
    }

    void sendOverdueNotifications() {
        LocalDate today = LocalDate.now();
        LocalDate earliest = today.minusDays(OVERDUE_THRESHOLD_DAYS);

        List<LegalCase> cases = legalCaseRepository.findOverdueCasesBetween(earliest, today);
        int count = 0;
        for (LegalCase legalCase : cases) {
            if (legalCase.getExpiredDate() == null) {
                continue;
            }
            long daysOverdue = ChronoUnit.DAYS.between(legalCase.getExpiredDate(), today);
            if (daysOverdue < 0 || daysOverdue > OVERDUE_THRESHOLD_DAYS) {
                continue;
            }
            try {
                notificationService.notifyOverdue(legalCase, daysOverdue);
                count++;
            } catch (Exception e) {
                log.warn("Lỗi gửi thông báo quá hạn cho án {}: {}",
                        legalCase.getLegalCaseId(), e.getMessage());
            }
        }
        log.info("[NotificationScheduler] Đã gửi {} thông báo án quá hạn.", count);
    }
}
