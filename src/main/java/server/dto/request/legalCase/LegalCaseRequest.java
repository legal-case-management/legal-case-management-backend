package server.dto.request.legalCase;

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
public class LegalCaseRequest {
    String acceptanceNumber;
    LocalDate acceptanceDate;
    String plaintiff;
    String defendant;
    String legalRelationshipId;
    String judgeId;
}
