package server.dto.response.legalRelationship;

import lombok.*;
import lombok.experimental.FieldDefaults;

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
    String typeOfLegalCaseId;
    String typeOfLegalCaseName;
    String legalRelationshipGroupId;
    String legalRelationshipGroupName;
}
