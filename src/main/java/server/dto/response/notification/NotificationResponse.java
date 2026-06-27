package server.dto.response.notification;


import lombok.*;
import lombok.experimental.FieldDefaults;
import lombok.experimental.SuperBuilder;
import server.entity.enums.NotificationType;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@SuperBuilder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class NotificationResponse {
    String notificationId;
    NotificationType notificationType;
    String title;
    String content;
    LocalDateTime createdAt;
    boolean isRead;
}
