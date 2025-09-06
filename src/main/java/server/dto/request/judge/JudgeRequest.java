package server.dto.request.judge;

import lombok.*;
import lombok.experimental.FieldDefaults;
import server.entity.enums.StatusOfOfficer;

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
    StatusOfOfficer statusOfJudge;
    String email;
}
