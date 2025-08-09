package server.dto.request;

import lombok.*;
import lombok.experimental.FieldDefaults;
import server.entity.enums.*;
import server.validator.DateOfBirthConstraint;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class LegalCaseRequest {
    String legalCaseId;
    String acceptanceNumber;
    LocalDate acceptanceDate;
    String plaintiff;
    String defendant;
    String legalRelationshipId;
    String judgeId;
}
