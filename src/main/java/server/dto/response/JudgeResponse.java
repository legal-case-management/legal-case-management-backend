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
    String fullName;
    long maxNumberOfLegalCase;
    StatusOfJudge statusOfJudge;
}