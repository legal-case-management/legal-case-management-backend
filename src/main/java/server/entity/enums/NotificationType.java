package server.entity.enums;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@AllArgsConstructor
public enum NotificationType {
    LEGAL_CASE_CASE_ASSIGNED("Thông báo án được phân công"),
    LEGAL_CASE_UPCOMING_DEADLINE("Thông báo án sắp hết hạn"),
    LEGAL_CASE_OVERDUE("Thông báo án quá hạn")
    ;
    String name;
}
