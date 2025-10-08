package server.entity.enums;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@AllArgsConstructor
public enum StatusOfLegalCase {
    TEMPORARY_SUSPENSION("Tạm đình chỉ"),
    OVERDUE("Quá hạn"),
    CANCELED("Án hủy"),
    EDITED("Án sửa"),
    WAITING_FOR_ASSIGNMENT("Chờ được phân công"),
    IN_PROCESS("Đang giải quyết"),
    SOLVED("Đã được giải quyết"),
    UNDEFINED("Chưa xác định");
    String name;
}
