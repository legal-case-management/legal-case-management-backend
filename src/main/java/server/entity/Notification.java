package server.entity;


import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

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
    @GeneratedValue(strategy = GenerationType.UUID)
    String notificationId;
    String title;
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
