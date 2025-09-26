package server.dto.request.legalCase;

import lombok.*;
import lombok.experimental.FieldDefaults;
import server.entity.enums.StatusOfLegalCase;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class LegalCaseSearchRequest {
    String acceptanceNumber;
    LocalDate startAcceptanceDate;
    LocalDate endAcceptanceDate;
    String plaintiff;
    String plaintiffAddress;
    String defendant;
    String defendantAddress;
    String typeOfLegalCaseId;
    String legalRelationshipId;
    String legalRelationshipGroupId;
    StatusOfLegalCase statusOfLegalCase;
    String judgeName;
    String batchId;
    LocalDate startStorageDate;
    LocalDate endStorageDate;
}
