package server.entity;


import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import server.entity.enums.NotificationType;

import java.time.LocalDateTime;

@Entity
@Table(name = "notifications")
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
    @Column(name = "created_at", nullable = false)
    LocalDateTime createdAt;
    @Column(name = "is_read", nullable = false)
    boolean isRead;

    @ManyToOne
    @JoinColumn(name = "account_id", nullable = false)
    Account account;

    @ManyToOne
    @JoinColumn(name = "legal_case_id")
    LegalCase legalCase;
}
