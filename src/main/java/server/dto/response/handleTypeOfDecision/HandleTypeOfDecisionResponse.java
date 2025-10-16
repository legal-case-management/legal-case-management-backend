package server.dto.response.handleTypeOfDecision;

import lombok.*;
import lombok.experimental.FieldDefaults;
import server.dto.response.typeOfDecision.TypeOfDecisionResponse;
import server.entity.enums.LegalCaseStatus;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class HandleTypeOfDecisionResponse {
    TypeOfDecisionResponse decisionType;
    LegalCaseStatus preStatus;
    LegalCaseStatus postStatus;
    int extensionPeriod;
}