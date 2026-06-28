package server.entity;


import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
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
    @GeneratedValue(strategy = GenerationType.UUID)
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

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "legal_case_id")
    @OnDelete(action = OnDeleteAction.SET_NULL)
    LegalCase legalCase;
}
