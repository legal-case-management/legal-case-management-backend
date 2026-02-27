package server.dto.request.decisionType;

import com.fasterxml.jackson.annotation.JsonProperty;
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
public class DecisionTypeRequest {
    String decisionTypeName;
    String legalCaseTypeId;
    CourtIssued courtIssued;
    @JsonProperty("theEndDecision")
    boolean theEndDecision;
}
