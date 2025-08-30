package server.dto.request.legalCase;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class AssignAssignmentRequest {
    String legalCaseId;
    String judgeId;
}