package server.dto.response.judge;

import lombok.*;
import lombok.experimental.FieldDefaults;
import server.entity.enums.StatusOfJudge;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class JudgeResponse {
    String judgeId;
    String lastName;;
    String firstName;
    String fullName;
    long maxNumberOfLegalCase;
    long numberOfLegalCases;
    StatusOfJudge statusOfJudge;
    String email;
}