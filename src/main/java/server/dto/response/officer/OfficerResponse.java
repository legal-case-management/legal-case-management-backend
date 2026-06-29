package server.dto.response.officer;

import lombok.*;
import lombok.experimental.FieldDefaults;
import lombok.experimental.SuperBuilder;
import server.enums.OfficerStatus;

@Getter
@Setter
@NoArgsConstructor
@SuperBuilder(toBuilder = true)
@FieldDefaults(level = AccessLevel.PRIVATE)
@AllArgsConstructor
public class OfficerResponse {
    String officerId;
    String lastName;
    String firstName;
    String fullName;
    OfficerStatus officerStatus;
}
