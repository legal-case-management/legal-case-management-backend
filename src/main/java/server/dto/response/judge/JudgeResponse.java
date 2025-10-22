package server.dto.response.judge;

import com.fasterxml.jackson.annotation.JsonInclude;
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
@SuperBuilder(toBuilder = true)
@FieldDefaults(level = AccessLevel.PRIVATE)
@JsonInclude(JsonInclude.Include.NON_NULL)
public class JudgeResponse extends OfficerResponse {
    Long maxNumberOfLegalCase;
    Long numberOfLegalCase;
    Long numberOfInProcess;
    Long numberOfTemporarySuspension;
    Long numberOfOverdue;
    Long numberOfCanceledAndEdited;
    List<LegalRelationshipGroup> restrictedGroups;

    public JudgeResponse(
            String officerId,
            String lastName,
            String firstName,
            String fullName,
            OfficerStatus statusOfJudge,
            String email,
            Long maxNumberOfLegalCase,
            Long numberOfLegalCase,
            Long numberOfInProcess,
            Long numberOfTemporarySuspension,
            Long numberOfOverdue,
            Long numberOfCanceledAndEdited
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