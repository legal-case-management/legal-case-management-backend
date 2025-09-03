package server.dto.response.handleTypeOfDecision;

import lombok.*;
import lombok.experimental.FieldDefaults;
import server.dto.response.typeOfDecision.TypeOfDecisionResponse;
import server.entity.HandleTypeOfDecision;
import server.entity.TypeOfDecision;
import server.entity.enums.StatusOfLegalCase;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class HandleTypeOfDecisionResponse {
    TypeOfDecisionResponse typeOfDecision;
    StatusOfLegalCase preStatus;
    StatusOfLegalCase postStatus;
    int extensionPeriod;
}