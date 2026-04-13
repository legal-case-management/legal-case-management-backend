package server.dto.request.documentType;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;
import lombok.experimental.FieldDefaults;
import server.entity.enums.LegalCaseStatus;

import java.util.Set;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class DocumentTypeRequest {
    String documentTypeName;
    String legalCaseTypeId;
    Set<LegalCaseStatus> preStatuses;
    LegalCaseStatus postStatus;
    int extensionPeriod;
}
