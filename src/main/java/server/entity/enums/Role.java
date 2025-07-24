package server.entity.enums;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
@FieldDefaults(level = AccessLevel.PRIVATE)
public enum Role {
    ADMIN("Quyền quản lý"),
    JUDGE("Quyền thẩm phán");
    String name;

    Role(String name) {
        this.name = name;
    }
}
