package server.dto.response.legalRelationship;

import lombok.*;
import lombok.experimental.FieldDefaults;
import server.dto.response.legalRelationshipGroup.LegalRelationshipGroupResponse;
import server.dto.response.typeOfLegalCase.TypeOfLegalCaseResponse;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class LegalRelationshipResponse {
    String legalRelationshipId;
    String legalRelationshipName;
    TypeOfLegalCaseResponse legalCaseType;
    LegalRelationshipGroupResponse legalRelationshipGroup;
}
