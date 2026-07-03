package com.qlatakv9dt.service;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.qlatakv9dt.dto.response.PageResponse;
import com.qlatakv9dt.dto.response.notification.NotificationResponse;
import com.qlatakv9dt.entity.Account;
import com.qlatakv9dt.entity.Judge;
import com.qlatakv9dt.entity.LegalCase;
import com.qlatakv9dt.entity.Notification;
import com.qlatakv9dt.enums.Assignment;
import com.qlatakv9dt.enums.NotificationType;
import com.qlatakv9dt.exception.AppException;
import com.qlatakv9dt.exception.ErrorCode;
import com.qlatakv9dt.mapper.NotificationMapper;
import com.qlatakv9dt.mapper.PageMapper;
import com.qlatakv9dt.repository.AccountRepository;
import com.qlatakv9dt.repository.LegalCaseRepository;
import com.qlatakv9dt.repository.NotificationRepository;
import com.qlatakv9dt.utils.DateUtils;

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
        return notificationRepository.countByAccountAndReadFalse(account);
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

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void notifyCaseAssigned(LegalCase legalCase) {
        doNotifyCaseAssigned(legalCase);
    }

    private void doNotifyCaseAssigned(LegalCase legalCase) {
        Account judgeAccount = resolveJudgeAccount(legalCase);
        if (judgeAccount == null) {
            return;
        }

        String assignmentText = legalCase.getAssignment().getName();
        String title = "Bạn được phân công một vụ án";
        String content = String.format(
                "Bạn vừa được phân công một vụ án%s. Vui lòng kiểm tra thông tin vụ án.%s",
                assignmentText,
                caseInfo(legalCase)
        );

        createAndPush(judgeAccount, NotificationType.CASE_ASSIGNED, title, content, legalCase);
    }
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
        if (legalCase.getJudge() != null) {
            doNotifyCaseAssigned(legalCase);
        }
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void notifyImportExcel(List<LegalCase> legalCases, Account creator) {
        if (legalCases == null || legalCases.isEmpty()) {
            return;
        }

        // Thông báo nhập án thành công cho người nhập án.
        if (creator != null) {
            String title = "Nhập án mới thành công";
            String content = String.format(
                    "Một danh sách %d vụ án đã được nhập vào hệ thống thành công.",
                    legalCases.size()
            );
            createAndPush(creator, NotificationType.CASE_CREATED, title, content, null);
        }

        // Với mỗi án đã có sẵn thẩm phán -> thông báo phân công cho thẩm phán đó.
        // Gọi trực tiếp helper để cùng tham gia transaction mới này.
        for (LegalCase legalCase : legalCases) {
            if (legalCase.getJudge() != null) {
                doNotifyCaseAssigned(legalCase);
            }
        }
    }

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
                .read(false)
                .build();
    }

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
            long unread = notificationRepository.countByAccountAndReadFalse(account);
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
}
