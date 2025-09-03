package server.dto.response.handleTypeOfDecision;

import lombok.*;
import lombok.experimental.FieldDefaults;
import server.entity.enums.StatusOfLegalCase;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class HandleTypeOfDecisionResponse {
    StatusOfLegalCase preStatus;
    StatusOfLegalCase postStatus;
    int extensionPeriod;
}