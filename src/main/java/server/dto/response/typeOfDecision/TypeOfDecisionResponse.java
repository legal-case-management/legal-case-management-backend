package server.dto.response.typeOfDecision;

import lombok.*;
import lombok.experimental.FieldDefaults;
import server.dto.response.typeOfLegalCase.TypeOfLegalCaseResponse;
import server.entity.TypeOfLegalCase;
import server.entity.enums.CourtIssued;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class TypeOfDecisionResponse {
    String typeOfDecisionId;
    String typeOfDecisionName;
    TypeOfLegalCaseResponse typeOfLegalCase;
    CourtIssued courtIssued;
    boolean theEndDecision;
}
