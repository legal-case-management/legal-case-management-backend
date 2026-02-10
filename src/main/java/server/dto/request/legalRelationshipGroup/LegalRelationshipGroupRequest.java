package server.dto.request.legalRelationshipGroup;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class LegalRelationshipGroupRequest {
    String legalRelationshipGroupName;
    String description;
}
