package server.dto.request.legalRelationship;

import lombok.*;
import lombok.experimental.FieldDefaults;
import server.entity.LegalCaseType;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class LegalRelationshipRequest {
    String legalRelationshipName;
    String legalCaseTypeId;
    String legalRelationshipGroupId;
}
