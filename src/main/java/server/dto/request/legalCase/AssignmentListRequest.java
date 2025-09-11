package server.dto.request.legalCase;

import lombok.*;
import lombok.experimental.FieldDefaults;
import server.entity.LegalRelationshipGroup;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class AssignmentListRequest {
    boolean isMediator;
    String legalRelationshipGroupId;
}
