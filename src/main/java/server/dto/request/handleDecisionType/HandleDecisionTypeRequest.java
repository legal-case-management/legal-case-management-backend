package server.dto.request.handleDecisionType;

import lombok.*;
import lombok.experimental.FieldDefaults;
import server.entity.enums.LegalCaseStatus;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class HandleDecisionTypeRequest {
    String decisionTypeId;
    LegalCaseStatus preStatus;
    LegalCaseStatus postStatus;
    int extensionPeriod;
}