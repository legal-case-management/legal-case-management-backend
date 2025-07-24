package server.entity.enums;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
@FieldDefaults(level = AccessLevel.PRIVATE)
public enum Assignment {
    ASSIGN("Chỉ định"),
    RANDOM("Ngẩu nhiên");
    String name;

    Assignment(String name) {
        this.name = name;
    }
}
