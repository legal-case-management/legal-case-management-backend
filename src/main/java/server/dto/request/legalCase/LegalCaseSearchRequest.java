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
    String defendant;
    String legalRelationshipId;
    String typeOfLegalCaseId;
    String legalRelationshipGroupId;
    StatusOfLegalCase statusOfLegalCase;
    String judgeName;
    String batchId;
    LocalDate storageDate;
}
