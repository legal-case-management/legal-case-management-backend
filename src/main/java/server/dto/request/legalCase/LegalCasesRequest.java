package server.dto.request.legalCase;

import lombok.*;
import lombok.experimental.FieldDefaults;
import server.dto.request.batch.BatchRequest;

import java.time.LocalDate;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class LegalCasesRequest {
    List<LegalCaseRequest> legalCases;
    BatchRequest batch;
}
