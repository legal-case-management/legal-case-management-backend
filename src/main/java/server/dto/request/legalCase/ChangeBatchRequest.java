package server.dto.request.legalCase;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class ChangeBatchRequest {
    List<String> legalCaseIds;
    String batchId;
}
