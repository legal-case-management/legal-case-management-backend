package server.dto.response.handleDecisionType;

import lombok.*;
import lombok.experimental.FieldDefaults;
import server.dto.response.decisionType.DecisionTypeResponse;
import server.entity.enums.LegalCaseStatus;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class HandleDecisionTypeResponse {
    DecisionTypeResponse decisionType;
    LegalCaseStatus preStatus;
    LegalCaseStatus postStatus;
    boolean isTemporarilyPostponed;
    Integer extensionPeriod;
}