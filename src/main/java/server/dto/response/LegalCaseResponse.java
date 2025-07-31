package server.dto.response;

import com.fasterxml.jackson.annotation.JsonInclude;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import server.entity.Batch;
import server.entity.Judge;
import server.entity.enums.Assignment;
import server.entity.enums.LegalRelationship;
import server.entity.enums.StatusOfLegalCase;
import server.entity.enums.TypeOfLegalCase;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

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
    LegalRelationship legalRelationship;
    TypeOfLegalCase typeOfLegalCase;
    LocalDateTime storageDate;
    Assignment assignment;
    LocalDateTime assignmentDate;
    StatusOfLegalCase statusOfLegalCase;
    Batch batch;
    Judge judge;
}