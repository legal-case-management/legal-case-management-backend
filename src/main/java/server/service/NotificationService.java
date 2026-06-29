package server.service;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import server.dto.response.PageResponse;
import server.dto.response.notification.NotificationResponse;
import server.entity.Account;
import server.entity.Judge;
import server.entity.LegalCase;
import server.entity.Notification;
import server.entity.enums.Assignment;
import server.entity.enums.NotificationType;
import server.exception.AppException;
import server.exception.ErrorCode;
import server.mapper.NotificationMapper;
import server.mapper.PageMapper;
import server.repository.AccountRepository;
import server.repository.LegalCaseRepository;
import server.repository.NotificationRepository;
import server.utils.DateUtils;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@Slf4j
public class NotificationService {
    NotificationRepository notificationRepository;
    AccountRepository accountRepository;
    LegalCaseRepository legalCaseRepository;

    NotificationMapper notificationMapper;
    PageMapper pageMapper;

    AuthenticationService authenticationService;

    SimpMessagingTemplate messagingTemplate;

    public PageResponse<NotificationResponse> getMyNotifications(int page, int size, String sortBy) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(sortBy).descending());
        Account account = authenticationService.getCurrentAccount();

        Page<NotificationResponse> resultPage = notificationRepository
                .getNotificationByAccount(account, pageable)
                .map(notificationMapper::toNotificationResponse);

        return pageMapper.map(resultPage);
    }

    @Transactional
    public NotificationResponse getMyNotification(String id) {
        Account account = authenticationService.getCurrentAccount();

        Notification notification = notificationRepository
                .findByNotificationIdAndAccount(id, account)
                .orElseThrow(() -> new AppException(ErrorCode.NOTIFICATION_NOT_EXISTED));

        if (!notification.isRead()) {
            notification.setRead(true);
            notificationRepository.save(notification);
            pushUnreadCount(account);
        }

        return notificationMapper.toNotificationResponse(notification);
    }

    public long getMyUnreadCount() {
        Account account = authenticationService.getCurrentAccount();
        return notificationRepository.countByAccountAndIsReadFalse(account);
    }

    @Transactional
    public void markAsRead(List<String> notificationIds) {
        Account account = authenticationService.getCurrentAccount();
        if (notificationIds == null || notificationIds.isEmpty()) {
            return;
        }
        notificationRepository.markAsRead(account, notificationIds);
        pushUnreadCount(account);
    }

    @Transactional
    public void markAllAsRead() {
        Account account = authenticationService.getCurrentAccount();
        notificationRepository.markAllAsRead(account);
        pushUnreadCount(account);
    }

    /**
     * 1. Thông báo khi được phân công án (chỉ định / ngẫu nhiên / án mới có sẵn thẩm phán).
     * Gửi cho thẩm phán được phân công. Real-time.
     */
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void notifyCaseAssigned(LegalCase legalCase) {
        doNotifyCaseAssigned(legalCase);
    }

    private void doNotifyCaseAssigned(LegalCase legalCase) {
        Account judgeAccount = resolveJudgeAccount(legalCase);
        if (judgeAccount == null) {
            return;
        }

        String assignmentText = describeAssignment(legalCase.getAssignment());
        String title = "Bạn được phân công một vụ án";
        String content = String.format(
                "Bạn vừa được phân công một vụ án%s. Vui lòng kiểm tra thông tin vụ án.%s",
                assignmentText,
                caseInfo(legalCase)
        );

        createAndPush(judgeAccount, NotificationType.CASE_ASSIGNED, title, content, legalCase);
    }

    /**
     * 4. Thông báo nhập án mới cho người nhập án. Real-time.
     * Nếu án mới đã có thẩm phán thì gọi thêm {@link #notifyCaseAssigned(LegalCase)}.
     */
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void notifyCaseCreated(LegalCase legalCase, Account creator) {
        if (creator != null) {
            String title = "Nhập án mới thành công";
            String content = String.format(
                    "Một vụ án đã được nhập vào hệ thống thành công.%s",
                    caseInfo(legalCase)
            );
            createAndPush(creator, NotificationType.CASE_CREATED, title, content, legalCase);
        }

        // Nếu án mới đã có sẵn thẩm phán -> thông báo phân công cho thẩm phán đó.
        // Gọi trực tiếp helper để cùng tham gia transaction mới này.
        if (legalCase.getJudge() != null) {
            doNotifyCaseAssigned(legalCase);
        }
    }

    /**
     * 5. Thông báo khi xóa án.
     * Gửi cho người thực hiện xóa và thẩm phán được phân công (nếu có). Real-time.
     */
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void notifyCaseDeleted(LegalCase legalCase, Account actor) {
        String title = "Một vụ án đã bị xóa";
        String content = String.format(
                "Một vụ án đã bị xóa khỏi hệ thống.%s",
                caseInfo(legalCase)
        );

        Set<String> notifiedAccountIds = new HashSet<>();

        if (actor != null) {
            createAndPushDeleted(actor, title, content);
            notifiedAccountIds.add(actor.getAccountId());
        }

        Account judgeAccount = resolveJudgeAccount(legalCase);
        if (judgeAccount != null && !notifiedAccountIds.contains(judgeAccount.getAccountId())) {
            createAndPushDeleted(judgeAccount, title, content);
        }
    }

    /**
     * 6. Thông báo khi cập nhật thông tin án.
     * Gửi cho người thực hiện cập nhật và thẩm phán được phân công (nếu có). Real-time.
     */
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void notifyCaseUpdated(LegalCase legalCase, Account actor) {
        String title = "Thông tin vụ án đã được cập nhật";
        String content = String.format(
                "Thông tin một vụ án vừa được cập nhật.%s",
                caseInfo(legalCase)
        );

        Set<String> notifiedAccountIds = new HashSet<>();

        if (actor != null) {
            createAndPush(actor, NotificationType.CASE_UPDATED, title, content, legalCase);
            notifiedAccountIds.add(actor.getAccountId());
        }

        Account judgeAccount = resolveJudgeAccount(legalCase);
        if (judgeAccount != null && !notifiedAccountIds.contains(judgeAccount.getAccountId())) {
            createAndPush(judgeAccount, NotificationType.CASE_UPDATED, title, content, legalCase);
        }
    }

    /**
     * 7. Thông báo khi gỡ phân công thẩm phán.
     * Gửi cho người thực hiện gỡ và thẩm phán bị gỡ phân công. Real-time.
     *
     * @param removedJudge thẩm phán bị gỡ (lấy trước khi set null trên legalCase)
     */
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void notifyAssignmentRemoved(LegalCase legalCase, Judge removedJudge, Account actor) {
        String title = "Gỡ phân công thẩm phán";

        Set<String> notifiedAccountIds = new HashSet<>();

        if (actor != null) {
            String contentForActor = String.format(
                    "Bạn đã gỡ phân công thẩm phán khỏi một vụ án.%s",
                    caseInfo(legalCase)
            );
            createAndPush(actor, NotificationType.ASSIGNMENT_REMOVED, title, contentForActor, legalCase);
            notifiedAccountIds.add(actor.getAccountId());
        }

        if (removedJudge != null) {
            Account judgeAccount = accountRepository
                    .findAccountByOfficerOfficerId(removedJudge.getOfficerId())
                    .orElse(null);
            if (judgeAccount != null && !notifiedAccountIds.contains(judgeAccount.getAccountId())) {
                String contentForJudge = String.format(
                        "Bạn đã bị gỡ phân công khỏi một vụ án.%s",
                        caseInfo(legalCase)
                );
                createAndPush(judgeAccount, NotificationType.ASSIGNMENT_REMOVED, title, contentForJudge, legalCase);
            }
        }
    }

    /**
     * 2. Thông báo án sắp hết hạn (<= 7 ngày). Gửi cho thẩm phán được phân công.
     */
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void notifyUpcomingDeadline(LegalCase legalCase, long daysLeft) {
        Account judgeAccount = resolveJudgeAccount(legalCase);
        if (judgeAccount == null) {
            return;
        }
        String title = "Vụ án sắp hết hạn";
        String content = String.format(
                "Một vụ án bạn phụ trách sẽ hết hạn trong %d ngày (hạn: %s).%s",
                daysLeft,
                DateUtils.formatLocalDate(legalCase.getExpiredDate()),
                caseInfo(legalCase)
        );
        createAndPush(judgeAccount, NotificationType.UPCOMING_DEADLINE, title, content, legalCase);
    }

    /**
     * 3. Thông báo án quá hạn. Gửi cho thẩm phán được phân công.
     */
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void notifyOverdue(LegalCase legalCase, long daysOverdue) {
        Account judgeAccount = resolveJudgeAccount(legalCase);
        if (judgeAccount == null) {
            return;
        }
        String title = "Vụ án đã quá hạn";
        String content = daysOverdue == 0
                ? String.format(
                        "Một vụ án bạn phụ trách đã đến hạn hôm nay (%s) và bị quá hạn.%s",
                        DateUtils.formatLocalDate(legalCase.getExpiredDate()),
                        caseInfo(legalCase))
                : String.format(
                        "Một vụ án bạn phụ trách đã quá hạn %d ngày (hạn: %s).%s",
                        daysOverdue,
                        DateUtils.formatLocalDate(legalCase.getExpiredDate()),
                        caseInfo(legalCase));
        createAndPush(judgeAccount, NotificationType.OVERDUE, title, content, legalCase);
    }

    private void createAndPush(Account account, NotificationType type, String title, String content, LegalCase legalCase) {
        Notification notification = buildNotification(account, type, title, content);
        if (legalCase != null && legalCase.getLegalCaseId() != null) {
            notification.setLegalCase(legalCaseRepository.getReferenceById(legalCase.getLegalCaseId()));
        }
        persistAndPush(account, notification);
    }

    /**
     * Trường hợp xóa án: KHÔNG gắn reference tới án (vì án đang/sẽ bị xóa).
     * Thông tin án đã được nhúng sẵn trong content khi tạo thông báo.
     */
    private void createAndPushDeleted(Account account, String title, String content) {
        Notification notification = buildNotification(account, NotificationType.CASE_DELETED, title, content);
        persistAndPush(account, notification);
    }

    private void persistAndPush(Account account, Notification notification) {
        notificationRepository.saveAndFlush(notification);
        NotificationResponse response = notificationMapper.toNotificationResponse(notification);
        pushNotification(account, response);
        pushUnreadCount(account);
    }

    private Notification buildNotification(Account account, NotificationType type, String title, String content) {
        Account managedAccount = accountRepository.getReferenceById(account.getAccountId());
        return Notification.builder()
                .account(managedAccount)
                .notificationType(type)
                .title(title)
                .content(content)
                .storageDate(LocalDateTime.now())
                .isRead(false)
                .build();
    }

    /**
     * Khối thông tin án nhúng vào content: mã án, số thụ lý, ngày thụ lý, loại án.
     */
    private String caseInfo(LegalCase legalCase) {
        if (legalCase == null) {
            return "";
        }
        String legalCaseTypeName = "";
        try {
            if (legalCase.getLegalRelationship() != null
                    && legalCase.getLegalRelationship().getLegalCaseType() != null) {
                legalCaseTypeName = legalCase.getLegalRelationship().getLegalCaseType().getLegalCaseTypeName();
            }
        } catch (Exception ignored) {
            // Quan hệ có thể chưa tải -> bỏ qua, không để ảnh hưởng nội dung chính.
        }
        return String.format(
                "%n- Mã án: %s%n- Số thụ lý: %s%n- Ngày thụ lý: %s%n- Loại án: %s",
                legalCase.getLegalCaseId(),
                legalCase.getAcceptanceNumber(),
                DateUtils.formatLocalDate(legalCase.getAcceptanceDate()),
                legalCaseTypeName
        );
    }

    private void pushNotification(Account account, NotificationResponse response) {
        try {
            messagingTemplate.convertAndSendToUser(
                    account.getAccountId(),
                    "/queue/notifications",
                    response
            );
        } catch (Exception e) {
            log.warn("Không thể đẩy thông báo real-time tới account {}: {}", account.getAccountId(), e.getMessage());
        }
    }

    private void pushUnreadCount(Account account) {
        try {
            long unread = notificationRepository.countByAccountAndIsReadFalse(account);
            messagingTemplate.convertAndSendToUser(
                    account.getAccountId(),
                    "/queue/notifications-unread",
                    unread
            );
        } catch (Exception e) {
            log.warn("Không thể đẩy số thông báo chưa đọc tới account {}: {}", account.getAccountId(), e.getMessage());
        }
    }

    private Account resolveJudgeAccount(LegalCase legalCase) {
        if (legalCase == null || legalCase.getJudge() == null) {
            return null;
        }
        return accountRepository
                .findAccountByOfficerOfficerId(legalCase.getJudge().getOfficerId())
                .orElse(null);
    }

    private String describeAssignment(Assignment assignment) {
        if (assignment == null) {
            return "";
        }
        return switch (assignment) {
            case ASSIGN -> " (phân công chỉ định)";
            case RANDOM -> " (phân công ngẫu nhiên)";
        };
    }
}
