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
import server.repository.NotificationRepository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.*;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@Slf4j
public class NotificationService {
    NotificationRepository notificationRepository;
    AccountRepository accountRepository;

    NotificationMapper notificationMapper;
    PageMapper pageMapper;

    SimpMessagingTemplate messagingTemplate;

    /* =========================================================================
     *  TRUY VẤN (cho người dùng đang đăng nhập)
     * ========================================================================= */

    public PageResponse<NotificationResponse> getMyNotifications(int page, int size, String sortBy) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(sortBy).descending());
        Account account = getCurrentAccount();

        Page<NotificationResponse> resultPage = notificationRepository
                .getNotificationByAccount(account, pageable)
                .map(notificationMapper::toNotificationResponse);

        return pageMapper.map(resultPage);
    }

    @Transactional
    public NotificationResponse getMyNotification(String id) {
        Account account = getCurrentAccount();

        Notification notification = notificationRepository
                .findByNotificationIdAndAccount(id, account)
                .orElseThrow(() -> new AppException(ErrorCode.NOTIFICATION_NOT_EXISTED));

        // Xem chi tiết được coi là đã đọc.
        if (!notification.isRead()) {
            notification.setRead(true);
            notificationRepository.save(notification);
            pushUnreadCount(account);
        }

        return notificationMapper.toNotificationResponse(notification);
    }

    public long getMyUnreadCount() {
        return notificationRepository.countByAccountAndIsReadFalse(getCurrentAccount());
    }

    @Transactional
    public void markAsRead(List<String> notificationIds) {
        Account account = getCurrentAccount();
        if (notificationIds == null || notificationIds.isEmpty()) {
            return;
        }
        notificationRepository.markAsRead(account, notificationIds);
        pushUnreadCount(account);
    }

    @Transactional
    public void markAllAsRead() {
        Account account = getCurrentAccount();
        notificationRepository.markAllAsRead(account);
        pushUnreadCount(account);
    }

    /* =========================================================================
     *  TẠO THÔNG BÁO THEO TỪNG NGHIỆP VỤ
     * ========================================================================= */

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
                "Bạn vừa được phân công vụ án có số thụ lý %s%s. Vui lòng kiểm tra thông tin vụ án.",
                safe(legalCase.getAcceptanceNumber()),
                assignmentText
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
                    "Vụ án có số thụ lý %s đã được nhập vào hệ thống thành công.",
                    safe(legalCase.getAcceptanceNumber())
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
                "Vụ án có số thụ lý %s đã bị xóa khỏi hệ thống.",
                safe(legalCase.getAcceptanceNumber())
        );

        Set<String> notifiedAccountIds = new HashSet<>();

        if (actor != null) {
            createAndPushDeleted(actor, title, content, legalCase);
            notifiedAccountIds.add(actor.getAccountId());
        }

        Account judgeAccount = resolveJudgeAccount(legalCase);
        if (judgeAccount != null && !notifiedAccountIds.contains(judgeAccount.getAccountId())) {
            createAndPushDeleted(judgeAccount, title, content, legalCase);
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
                "Thông tin vụ án có số thụ lý %s vừa được cập nhật.",
                safe(legalCase.getAcceptanceNumber())
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
                    "Bạn đã gỡ phân công thẩm phán khỏi vụ án có số thụ lý %s.",
                    safe(legalCase.getAcceptanceNumber())
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
                        "Bạn đã bị gỡ phân công khỏi vụ án có số thụ lý %s.",
                        safe(legalCase.getAcceptanceNumber())
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
                "Vụ án có số thụ lý %s sẽ hết hạn trong %d ngày (hạn: %s).",
                safe(legalCase.getAcceptanceNumber()),
                daysLeft,
                legalCase.getExpiredDate()
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
                        "Vụ án có số thụ lý %s đã đến hạn hôm nay (%s) và bị quá hạn.",
                        safe(legalCase.getAcceptanceNumber()),
                        legalCase.getExpiredDate())
                : String.format(
                        "Vụ án có số thụ lý %s đã quá hạn %d ngày (hạn: %s).",
                        safe(legalCase.getAcceptanceNumber()),
                        daysOverdue,
                        legalCase.getExpiredDate());
        createAndPush(judgeAccount, NotificationType.OVERDUE, title, content, legalCase);
    }

    /* =========================================================================
     *  HÀM HỖ TRỢ
     * ========================================================================= */

    private void createAndPush(Account account, NotificationType type, String title, String content, LegalCase legalCase) {
        Notification notification = buildNotification(account, type, title, content);
        if (legalCase != null) {
            notification.setLegalCaseId(legalCase.getLegalCaseId());
            notification.setAcceptanceNumber(legalCase.getAcceptanceNumber());
        }
        persistAndPush(account, notification);
    }

    /**
     * Trường hợp xóa án: vẫn lưu số thụ lý để hiển thị nhưng KHÔNG lưu legalCaseId
     * (vì án không còn tồn tại, không nên link tới trang chi tiết án đã xóa).
     */
    private void createAndPushDeleted(Account account, String title, String content, LegalCase legalCase) {
        Notification notification = buildNotification(account, NotificationType.CASE_DELETED, title, content);
        if (legalCase != null) {
            notification.setAcceptanceNumber(legalCase.getAcceptanceNumber());
        }
        persistAndPush(account, notification);
    }

    private void persistAndPush(Account account, Notification notification) {
        // saveAndFlush để bản ghi được ghi xuống DB ngay trong transaction hiện tại,
        // nhờ đó generateId() (dựa trên getMaxId) thấy được id vừa tạo, tránh trùng id
        // khi một nghiệp vụ tạo nhiều thông báo (vd: thông báo cho cả người tạo và thẩm phán).
        notificationRepository.saveAndFlush(notification);
        NotificationResponse response = notificationMapper.toNotificationResponse(notification);
        pushNotification(account, response);
        pushUnreadCount(account);
    }

    private Notification buildNotification(Account account, NotificationType type, String title, String content) {
        // Vì các phương thức notify chạy trong transaction mới (REQUIRES_NEW), account
        // truyền vào có thể đã detached. Lấy reference theo id để gắn vào transaction hiện tại.
        Account managedAccount = accountRepository.getReferenceById(account.getAccountId());
        return Notification.builder()
                .notificationId(generateId())
                .account(managedAccount)
                .notificationType(type)
                .title(title)
                .content(content)
                .storageDate(LocalDateTime.now())
                .isRead(false)
                .build();
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

    private Account getCurrentAccount() {
        SecurityContext context = SecurityContextHolder.getContext();
        String accountId = Objects.requireNonNull(context.getAuthentication()).getName();
        return accountRepository.findById(accountId)
                .orElseThrow(() -> new AppException(ErrorCode.ACCOUNT_NOT_EXISTED));
    }

    /**
     * Lấy tài khoản đang đăng nhập, trả về null nếu không xác định được
     * (ví dụ tiến trình chạy nền không có SecurityContext).
     */
    public Account getCurrentActorOrNull() {
        SecurityContext context = SecurityContextHolder.getContext();
        Authentication authentication = context.getAuthentication();
        if (authentication == null || authentication.getName() == null) {
            return null;
        }
        return accountRepository.findById(authentication.getName()).orElse(null);
    }

    private synchronized String generateId() {
        String year = String.format("%04d", LocalDate.now().getYear());
        int next = notificationRepository.getMaxId(year).orElse(0) + 1;
        return String.format("%sTB%06d", year, next);
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

    private String safe(String value) {
        return value == null ? "" : value;
    }
}
