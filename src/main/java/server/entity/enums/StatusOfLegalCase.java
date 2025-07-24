package server.entity.enums;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
@FieldDefaults(level = AccessLevel.PRIVATE)
public enum StatusOfLegalCase {
    TEMPORARY_SUSPENSION("Tạm đình chỉ"),
    OVERDUE("Quá hạn"),
    CANCELED_EDIT("Hủy, sửa"),
    WAITING_FOR_ASSIGNMENT("Chờ được phân công"),
    IN_PROCESS("Đang giải quyết"),
    SOLVED("Đã được giải quyết");
    String name;

    StatusOfLegalCase(String name) {
        this.name = name;
    }
}
