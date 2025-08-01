package server.dto.response;

import com.fasterxml.jackson.annotation.JsonInclude;
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