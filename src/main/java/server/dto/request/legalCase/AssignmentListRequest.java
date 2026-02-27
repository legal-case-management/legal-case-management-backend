package server.dto.request.legalCase;

import com.fasterxml.jackson.annotation.JsonProperty;
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
    @JsonProperty("mediator")
    boolean mediator;
    String legalRelationshipGroupId;
}
