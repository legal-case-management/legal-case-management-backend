package com.qlatakv9dt.dto.request.legalCaseType;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class LegalCaseTypeRequest {
    String legalCaseTypeName;
    String codeName;
}
