package server.dto.response.batch;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class BatchResponse {
    String batchId;
    String batchName;
    String note;
    LocalDateTime storageDate;
}
