package server.dto.request.judge;

import lombok.*;
import lombok.experimental.FieldDefaults;
import server.entity.enums.StatusOfJudge;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class JudgeRequest {
    String firstName;
    String lastName;
    long maxNumberOfLegalCase;
    StatusOfJudge statusOfJudge;
    String email;
}
