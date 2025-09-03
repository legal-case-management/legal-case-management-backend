package server.dto.request.handleTypeOfDecision;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import server.entity.TypeOfDecision;
import server.entity.enums.StatusOfLegalCase;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class HandleTypeOfDecisionRequest {
    String typeOfDecisionId;
    StatusOfLegalCase preStatus;
    StatusOfLegalCase postStatus;
    int extensionPeriod;
}