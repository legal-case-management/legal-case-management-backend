package com.qlatakv9dt.dto.request.documentType;

import lombok.*;
import lombok.experimental.FieldDefaults;
import com.qlatakv9dt.enums.LegalCaseStatus;

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
