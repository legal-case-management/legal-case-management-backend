package server.enums;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@AllArgsConstructor
public enum Role {
    ADMIN("Quản trị viên"),
    MANAGER("Quản lý"),
    JUDGE("Thẩm phán"),
    MEDIATOR("Hòa giải viên"),
    ;
    String name;
}
