package server.dto.other;


import lombok.*;
import lombok.experimental.FieldDefaults;
import lombok.experimental.SuperBuilder;
import server.entity.enums.OfficerStatus;

@Getter
@Setter
@NoArgsConstructor
@SuperBuilder(toBuilder = true)
@FieldDefaults(level = AccessLevel.PRIVATE)
@AllArgsConstructor
public class JudgeAssignmentInfo {
    String officerId;
    String lastName;
    String firstName;
    String fullName;
    OfficerStatus officerStatus;
    String email;
    Long maxNumberOfLegalCase;
    Long numberOfLegalCase;
    Long numberOfInProcess;
    Long numberOfTemporarySuspension;
    Long numberOfOverdue;
    Long numberOfCanceledAndEdited;
    Long numberOfLegalCaseGroupLand;
}
