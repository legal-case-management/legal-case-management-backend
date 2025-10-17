package server.entity.enums;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@AllArgsConstructor
public enum LitigantType {
    ACCUSED("Bị cáo"),
    PLAINTIFF("Nguyên đơn"),
    DEFENDANT("Bị đơn");
    String name;
}
