package server.entity.enums;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
@FieldDefaults(level = AccessLevel.PRIVATE)
public enum StatusOfJudge {
    WORKING("Đang làm việc"),
    NO_WORKING("Không còn làm việc"),
    ON_BUSINESS_TRIP("Đang công tác"),
    ON_LEAVE("Đang nghĩ phép"),
    DISCIPLINED("Đang bị kĩ luật");
    String name;

    StatusOfJudge(String name) {
        this.name = name;
    }
}
