package server.dto.request.officer;

import lombok.*;
import lombok.experimental.FieldDefaults;
import lombok.experimental.SuperBuilder;
import server.dto.request.mediator.MediatorSearchRequest;
import server.entity.enums.StatusOfOfficer;

@Getter
@Setter
@NoArgsConstructor
@SuperBuilder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class OfficerSearchRequest {
    String officerId;
    String fullName;
    StatusOfOfficer statusOfOfficer;
}
