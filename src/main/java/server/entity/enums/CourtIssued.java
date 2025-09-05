package server.entity.enums;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
@FieldDefaults(level = AccessLevel.PRIVATE)
public enum CourtIssued {
    CURRENT_COURT("Tòa án hiện tại"),
    SUPERIOR_COURT("Tòa án cấp trên"),
    ;
    String name;
    CourtIssued(String name) {
        this.name = name;
    }
}
