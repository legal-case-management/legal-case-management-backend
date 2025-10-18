package server.dto.response.judge;

import lombok.*;
import lombok.experimental.FieldDefaults;
import lombok.experimental.SuperBuilder;
import server.dto.response.officer.OfficerResponse;
import server.entity.LegalRelationshipGroup;
import server.entity.enums.OfficerStatus;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@SuperBuilder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class JudgeResponse extends OfficerResponse {
    long maxNumberOfLegalCase;
    long numberOfLegalCase;
    long numberOfInProcess;
    long numberOfTemporarySuspension;
    long numberOfOverdue;
    long numberOfCanceledAndEdited;
    List<LegalRelationshipGroup> restrictedGroups;

    public JudgeResponse(
            String officerId,
            String lastName,
            String firstName,
            String fullName,
            OfficerStatus statusOfJudge,
            String email,
            long maxNumberOfLegalCase,
            long numberOfLegalCase,
            long numberOfInProcess,
            long numberOfTemporarySuspension,
            long numberOfOverdue,
            long numberOfCanceledAndEdited
    ) {
        super(officerId, lastName, firstName, fullName, statusOfJudge, email);
        this.maxNumberOfLegalCase = maxNumberOfLegalCase;
        this.numberOfLegalCase = numberOfLegalCase;
        this.numberOfInProcess = numberOfInProcess;
        this.numberOfCanceledAndEdited = numberOfCanceledAndEdited;
        this.numberOfOverdue = numberOfOverdue;
        this.numberOfTemporarySuspension = numberOfTemporarySuspension;
    }
}