package server.entity;


import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import server.entity.enums.NotificationType;

import java.time.LocalDateTime;

@Entity
@Table(
        name = "notifications",
        indexes = {
                @Index(name = "idx_notification_account", columnList = "account_id"),
                @Index(name = "idx_notification_storage_date", columnList = "storage_date")
        }
)
@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class Notification {
    @Id
    @Column(name = "notification_id")
    String notificationId;

    @Enumerated(EnumType.STRING)
    @Column(name = "notification_type", nullable = false)
    NotificationType notificationType;

    String title;
    @Column(length = 2000)
    String content;
    @Column(name = "storage_date", nullable = false)
    LocalDateTime storageDate;
    @Column(name = "is_read", nullable = false)
    boolean isRead;

    @ManyToOne
    @JoinColumn(name = "account_id", nullable = false)
    Account account;

    /*
     * Lưu ID/số thụ lý của án dưới dạng chuỗi (không phải khóa ngoại) để thông báo
     * vẫn còn liên kết tới án sau khi án bị xóa. Với loại "xóa án" thì án không còn
     * tồn tại nên không thể dùng khóa ngoại.
     */
    @Column(name = "legal_case_id")
    String legalCaseId;

    @Column(name = "acceptance_number")
    String acceptanceNumber;
}
