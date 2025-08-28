package server.dto.request.batch;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class BatchSearchRequest {
    String batchId;
    String batchName;
    String note;
    LocalDateTime storageDateStart;
    LocalDateTime storageDateEnd;
}
