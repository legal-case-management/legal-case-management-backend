package server.dto.request.legalCase;

import lombok.*;
import lombok.experimental.FieldDefaults;
import server.dto.request.litigant.LitigantRequest;

import java.time.LocalDate;
import java.util.List;

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
    String note;
    String legalRelationshipId;
    List<LitigantRequest> litigants;
    String judgeId;
    String mediatorId;
    String batchId;
}
