package server.dto.request;

import lombok.*;
import lombok.experimental.FieldDefaults;
import server.entity.enums.StatusOfLegalCase;
import server.entity.enums.TypeOfLegalCase;

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
    String legalRelationship;
    TypeOfLegalCase typeOfLegalCase;
    StatusOfLegalCase statusOfLegalCase;
    String judgeName;
}
