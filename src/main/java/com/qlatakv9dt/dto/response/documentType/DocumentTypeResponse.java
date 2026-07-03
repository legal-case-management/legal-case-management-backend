package com.qlatakv9dt.dto.response.documentType;

import lombok.*;
import lombok.experimental.FieldDefaults;
import com.qlatakv9dt.dto.response.legalCaseType.LegalCaseTypeResponse;
import com.qlatakv9dt.enums.LegalCaseStatus;

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
