package server.dto.request.officer;

import lombok.*;
import lombok.experimental.FieldDefaults;
import lombok.experimental.SuperBuilder;
import server.entity.enums.OfficerStatus;

@Getter
@Setter
@NoArgsConstructor
@SuperBuilder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class OfficerSearchRequest {
    String officerId;
    String fullName;
    OfficerStatus officerStatus;
}
