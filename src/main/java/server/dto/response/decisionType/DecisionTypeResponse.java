package server.dto.response.decisionType;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;
import lombok.experimental.FieldDefaults;
import server.dto.response.legalCaseType.LegalCaseTypeResponse;
import server.entity.enums.CourtIssued;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class DecisionTypeResponse {
    String decisionTypeId;
    String decisionTypeName;
    LegalCaseTypeResponse legalCaseType;
    CourtIssued courtIssued;
    @JsonProperty("isTheEndDecision")
    boolean isTheEndDecision;
}
