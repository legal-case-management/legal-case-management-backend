package server.dto.response.document;

import lombok.*;
import lombok.experimental.FieldDefaults;
import server.dto.response.legalCase.LegalCaseResponse;
import server.dto.response.documentType.DocumentTypeResponse;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class DocumentResponse {
    String decisionId;
    String number;
    LocalDate releaseDate;
    LocalDate addedDate;
    String note;
    DocumentTypeResponse decisionType;
    LegalCaseResponse legalCase;
}
