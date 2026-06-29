package server.dto.response.judge;


import lombok.*;
import lombok.experimental.FieldDefaults;
import lombok.experimental.SuperBuilder;
import server.enums.OfficerStatus;

@Getter
@Setter
@NoArgsConstructor
@SuperBuilder(toBuilder = true)
@FieldDefaults(level = AccessLevel.PRIVATE)
@AllArgsConstructor
public class JudgeAssignmentInfoResponse {
    String officerId;
    String fullName;
    OfficerStatus officerStatus;
    Long maxWithType;
    long numberWithType;
    long numberByCondition;
}
