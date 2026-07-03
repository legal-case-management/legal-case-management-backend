package com.qlatakv9dt.dto.response.document;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import lombok.experimental.FieldDefaults;
import com.qlatakv9dt.dto.response.legalCase.LegalCaseResponse;
import com.qlatakv9dt.dto.response.documentType.DocumentTypeResponse;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class DocumentResponse {
    String documentId;
    String documentNumber;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    LocalDate releaseDate;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    LocalDateTime storageDate;
    String note;
    DocumentTypeResponse documentType;
    LegalCaseResponse legalCase;
}
