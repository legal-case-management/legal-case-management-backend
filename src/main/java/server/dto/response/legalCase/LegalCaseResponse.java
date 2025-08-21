package server.dto.response.legalCase;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import lombok.experimental.FieldDefaults;
import server.dto.response.judge.JudgeResponse;
import server.dto.response.legalRelationship.LegalRelationshipResponse;
import server.entity.Batch;
import server.entity.Judge;
import server.entity.LegalRelationship;
import server.entity.enums.Assignment;
import server.entity.enums.StatusOfLegalCase;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class LegalCaseResponse {
    String legalCaseId;
    String acceptanceNumber;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    LocalDate acceptanceDate;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    LocalDate expiredDate;
    String plaintiff;
    String plaintiffAddress;
    String defendant;
    String defendantAddress;
    LegalRelationshipResponse legalRelationship;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    LocalDateTime storageDate;
    Assignment assignment;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    LocalDateTime assignmentDate;
    StatusOfLegalCase statusOfLegalCase;
//    Batch batch;
    JudgeResponse judge;
}