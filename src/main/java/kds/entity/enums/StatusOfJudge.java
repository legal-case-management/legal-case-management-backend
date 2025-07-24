package kds.entity.enums;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
@FieldDefaults(level = AccessLevel.PRIVATE)
public enum StatusOfJudge {
    WORKING("Đang làm việc"),
    NO_WORKING("Không còn làm việc");
    String name;

    StatusOfJudge(String name) {
        this.name = name;
    }
}
