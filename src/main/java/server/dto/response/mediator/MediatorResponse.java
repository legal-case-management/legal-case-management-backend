package server.dto.response.mediator;


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
@ToString
public class MediatorResponse extends OfficerResponse {
    long numberOfLegalCases;

    public MediatorResponse(String officerId, String lastName, String firstName, String fullName, StatusOfOfficer statusOfJudge, String email, long numberOfLegalCases) {
        super(officerId, lastName, firstName, fullName, statusOfJudge, email);
        this.numberOfLegalCases = numberOfLegalCases;
    }
}
