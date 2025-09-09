package server.dto.response.officer;

import lombok.*;
import lombok.experimental.FieldDefaults;
import lombok.experimental.SuperBuilder;
import server.entity.enums.StatusOfOfficer;

@Getter
@Setter
@NoArgsConstructor
@SuperBuilder
@FieldDefaults(level = AccessLevel.PRIVATE)
@AllArgsConstructor
public class OfficerResponse {
    String officerId;
    String lastName;
    String firstName;
    String fullName;
    StatusOfOfficer statusOfJudge;
    String email;
}
