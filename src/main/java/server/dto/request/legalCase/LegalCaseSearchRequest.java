package server.dto.request.legalCase;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import lombok.experimental.FieldDefaults;
import server.enums.LegalCaseStatus;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class LegalCaseSearchRequest {
    String acceptanceNumber;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    LocalDate startAcceptanceDate;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    LocalDate endAcceptanceDate;
    String legalCaseTypeId;
    String legalRelationshipId;
    String legalRelationshipGroupId;

    String litigantName;
    String litigantYearOfBirth;
    String litigantAddress;

    LegalCaseStatus legalCaseStatus;
    String judgeId;
    String batchId;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    LocalDateTime startStorageDate;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    LocalDateTime endStorageDate;
    Boolean mediator;
    String mediatorId;
}
