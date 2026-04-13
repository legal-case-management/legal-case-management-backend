package server.dto.response.documentType;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;
import lombok.experimental.FieldDefaults;
import server.dto.response.legalCaseType.LegalCaseTypeResponse;
import server.entity.enums.LegalCaseStatus;

import java.util.Set;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class DocumentTypeResponse {
    String documentTypeId;
    String documentTypeName;
    LegalCaseTypeResponse legalCaseType;
    Set<LegalCaseStatus> preStatuses;
    LegalCaseStatus postStatus;
    int extensionPeriod;
}
