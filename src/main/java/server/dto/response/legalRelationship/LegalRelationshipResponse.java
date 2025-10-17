package server.dto.response.legalRelationship;

import lombok.*;
import lombok.experimental.FieldDefaults;
import server.dto.response.legalRelationshipGroup.LegalRelationshipGroupResponse;
import server.dto.response.legalCaseType.LegalCaseTypeResponse;

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
    LegalCaseTypeResponse legalCaseType;
    LegalRelationshipGroupResponse legalRelationshipGroup;
}
