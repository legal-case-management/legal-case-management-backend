package server.dto.request;

import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
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
    String judgeId;
    String firstName;
    String lastName;
    long maxNumberOfLegalCase;
    StatusOfJudge statusOfJudge;
    String email;
}
