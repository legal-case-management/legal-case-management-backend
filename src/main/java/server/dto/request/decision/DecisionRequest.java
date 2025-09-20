package server.dto.request.decision;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class DecisionRequest {
    String number;
    LocalDate releaseDate;
    String note;
    String typeOfDecisionId;
    String legalCaseId;
}
