package com.qlatakv9dt.dto.request.legalCase;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class LegalCasesRequest {
    List<LegalCaseRequest> legalCases;
    String batchId;
}
