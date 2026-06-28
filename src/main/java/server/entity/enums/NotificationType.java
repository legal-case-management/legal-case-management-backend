package server.entity.enums;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@AllArgsConstructor
public enum NotificationType {
    /* 1. Được phân công án (chỉ định / ngẫu nhiên / án mới có sẵn thẩm phán) - real-time */
    CASE_ASSIGNED("Thông báo được phân công án"),
    /* 2. Án sắp hết hạn (<= 7 ngày) - 6h sáng hằng ngày */
    UPCOMING_DEADLINE("Thông báo án sắp hết hạn"),
    /* 3. Án quá hạn (0 -> 6 ngày sau hạn) - 6h sáng hằng ngày */
    OVERDUE("Thông báo án quá hạn"),
    /* 4. Nhập án mới (thông báo cho người nhập án) - real-time */
    CASE_CREATED("Thông báo nhập án mới"),
    /* 5. Xóa án - real-time */
    CASE_DELETED("Thông báo xóa án"),
    /* 6. Cập nhật thông tin án - real-time */
    CASE_UPDATED("Thông báo cập nhật thông tin án"),
    /* 7. Gỡ phân công thẩm phán - real-time */
    ASSIGNMENT_REMOVED("Thông báo gỡ phân công thẩm phán"),
    ;
    String name;
}
