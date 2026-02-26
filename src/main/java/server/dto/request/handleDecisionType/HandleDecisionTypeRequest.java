package server.dto.request.handleDecisionType;

import com.fasterxml.jackson.annotation.JsonProperty;
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
    LegalCaseStatus postStatus;
    @JsonProperty("isActive")
    boolean isActive;
    int extensionPeriod;
}