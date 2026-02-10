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
    /*
    * The maximum number of legal cases that can be assigned to the judge in a year.
    * */
    long maxNumberOfLegalCase;
    /*
    * The sum of legal cases currently assigned to the judge in this year.
    * */
    long numberOfLegalCase;
    /*
    * The sum of legal case land group that can be assigned to the judge in a year.
    * */
    long numberOfLegalCaseGroupLand;
}
