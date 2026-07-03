package com.qlatakv9dt.dto.request.document;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class DocumentRequest {
    String documentNumber;
    LocalDate releaseDate;
    String note;
    String documentTypeId;
    String legalCaseId;
}
