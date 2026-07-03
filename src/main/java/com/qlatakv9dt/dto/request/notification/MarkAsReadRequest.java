package com.qlatakv9dt.dto.request.notification;

import jakarta.validation.constraints.NotEmpty;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class MarkAsReadRequest {
    @NotEmpty(message = "Danh sách thông báo không được rỗng")
    List<String> notificationIds;
}
