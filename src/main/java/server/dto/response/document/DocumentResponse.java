package server.dto.response.document;

import lombok.*;
import lombok.experimental.FieldDefaults;
import server.dto.response.legalCase.LegalCaseResponse;
import server.dto.response.documentType.DocumentTypeResponse;

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
    LocalDate releaseDate;
    LocalDateTime storageDate;
    String note;
    DocumentTypeResponse documentType;
    LegalCaseResponse legalCase;
}
