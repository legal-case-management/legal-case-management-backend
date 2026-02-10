package server.entity.enums;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@AllArgsConstructor
public enum Assignment {
    ASSIGN("Chỉ định"),
    RANDOM("Ngẩu nhiên");
    String name;
}
