package server.dto.response.judge;

import lombok.*;
import lombok.experimental.FieldDefaults;
import lombok.experimental.SuperBuilder;
import server.dto.response.officer.OfficerResponse;
import server.entity.enums.StatusOfOfficer;

@Getter
@Setter
@NoArgsConstructor
@SuperBuilder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class JudgeResponse extends OfficerResponse {
    long maxNumberOfLegalCase;
    long numberOfLegalCases;
    long numberOfTemporarySuspension;
    long numberOfOverdue;
    long numberOfCanceledAndEdited;

    public JudgeResponse(
            String officerId,
            String lastName,
            String firstName,
            String fullName,
            StatusOfOfficer statusOfJudge,
            String email,
            long maxNumberOfLegalCase,
            long numberOfLegalCases,
            long numberOfTemporarySuspension,
            long numberOfOverdue,
            long numberOfCanceledAndEdited
    ) {
        super(officerId, lastName, firstName, fullName, statusOfJudge, email);
        this.maxNumberOfLegalCase = maxNumberOfLegalCase;
        this.numberOfCanceledAndEdited = numberOfCanceledAndEdited;
        this.numberOfLegalCases = numberOfLegalCases;
        this.numberOfOverdue = numberOfOverdue;
        this.numberOfTemporarySuspension = numberOfTemporarySuspension;
    }
}