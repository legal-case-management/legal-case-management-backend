package server.dto.response;

import com.fasterxml.jackson.annotation.JsonInclude;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import server.entity.Judge;
import server.entity.enums.Assignment;
import server.entity.enums.StatusOfLegalCase;
import server.entity.enums.TypeOfLegalCase;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class LegalCaseResponse {
    String legalCaseId;
    String acceptanceNumber;
    LocalDate acceptanceDate;
    LocalDate expiredDate;
    String plaintiff;
    String defendant;
    String legalRelationship;
    TypeOfLegalCase typeOfLegalCase;
    Assignment assignment;
    StatusOfLegalCase statusOfLegalCase;
    Judge judge;
}