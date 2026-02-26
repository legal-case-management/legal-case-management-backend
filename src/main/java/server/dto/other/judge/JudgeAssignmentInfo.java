package server.dto.other.judge;


import lombok.*;
import lombok.experimental.FieldDefaults;
import lombok.experimental.SuperBuilder;

@Getter
@Setter
@NoArgsConstructor
@SuperBuilder(toBuilder = true)
@FieldDefaults(level = AccessLevel.PRIVATE)
@AllArgsConstructor
public class JudgeAssignmentInfo {
    String officerId;
    Long maxWithMediator;
    Long maxWithoutMediator;
    long numberWithMediator;
    long numberWithoutMediator;
    long numberLegalCase;
    long numberGroupLand;
}
