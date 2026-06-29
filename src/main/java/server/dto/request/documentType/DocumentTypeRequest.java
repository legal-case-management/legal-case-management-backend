package server.dto.request.documentType;

import lombok.*;
import lombok.experimental.FieldDefaults;
import server.enums.LegalCaseStatus;

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
