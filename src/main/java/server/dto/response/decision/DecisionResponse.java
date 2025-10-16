package server.dto.response.decision;

import lombok.*;
import lombok.experimental.FieldDefaults;
import server.dto.response.legalCase.LegalCaseResponse;
import server.dto.response.typeOfDecision.TypeOfDecisionResponse;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class DecisionResponse {
    String decisionId;
    String number;
    LocalDate releaseDate;
    LocalDate addedDate;
    String note;
    TypeOfDecisionResponse decisionType;
    LegalCaseResponse legalCase;
}
