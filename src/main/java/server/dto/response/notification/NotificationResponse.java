package server.dto.response.notification;


import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;
import lombok.experimental.FieldDefaults;
import lombok.experimental.SuperBuilder;
import server.entity.enums.NotificationType;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class NotificationResponse {
    String notificationId;
    NotificationType notificationType;
    String title;
    String content;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    LocalDateTime storageDate;
    // Serialize đúng tên "isRead" để khớp với frontend (mặc định Jackson sẽ là "read").
    @JsonProperty("isRead")
    boolean isRead;

    // Các trường dưới đây lấy từ án liên quan (null khi án đã bị xóa) — dùng để tạo link
    // tới trang chi tiết án. Thông tin hiển thị chính đã nằm trong `content`.
    String legalCaseId;
    String acceptanceNumber;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    LocalDate acceptanceDate;
}
