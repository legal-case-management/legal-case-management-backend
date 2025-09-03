package server.dto.request.decision;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import server.entity.LegalCase;
import server.entity.TypeOfDecision;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class DecisionRequest {
    String acceptanceNumber;
    LocalDate acceptanceDate;
    String note;
    String typeOfDecisionId;
    String legalCaseId;
}
