package server.dto.response.legalRelationshipGroup;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class LegalRelationshipGroupResponse {
    String legalRelationshipGroupId;
    String legalRelationshipGroupName;
    String description;
}
