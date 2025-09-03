package server.dto.request.typeOfDecision;

import lombok.*;
import lombok.experimental.FieldDefaults;
import server.entity.TypeOfLegalCase;
import server.entity.enums.CourtIssued;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class TypeOfDecisionRequest {
    String typeOfDecisionName;
    String typeOfLegalCaseId;
    CourtIssued courtIssued;
    boolean theEndDecision;
}
