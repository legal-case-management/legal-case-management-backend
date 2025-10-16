package server.dto.request.decisionType;

import lombok.*;
import lombok.experimental.FieldDefaults;
import server.entity.enums.CourtIssued;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class DecisionTypeSearchRequest {
    String decisionTypeId;
    String decisionTypeName;
    String legalCaseTypeId;
    CourtIssued courtIssued;
    boolean theEndDecision;
}
