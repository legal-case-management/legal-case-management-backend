package server.dto.request.officer;

import lombok.*;
import lombok.experimental.FieldDefaults;
import lombok.experimental.SuperBuilder;
import server.entity.enums.StatusOfOfficer;

@Getter
@Setter
@NoArgsConstructor
@SuperBuilder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class OfficerRequest {
    String firstName;
    String lastName;
    StatusOfOfficer statusOfOfficer;
    String email;
}
