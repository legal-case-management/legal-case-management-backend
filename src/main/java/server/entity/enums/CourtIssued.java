package server.entity.enums;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@AllArgsConstructor
public enum CourtIssued {
    CURRENT_COURT("Tòa án hiện tại"),
    SUPERIOR_COURT("Tòa án cấp trên"),
    ;
    String name;
}
