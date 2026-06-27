package server.entity.enums;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@AllArgsConstructor
public enum NotificationType {
    UPCOMING_DEADLINE("Thông báo án sắp hết hạn"),
    OVERDUE_CASE("Thông báo án quá hạn");
    String name;
}
