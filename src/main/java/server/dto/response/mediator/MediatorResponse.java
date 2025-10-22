package server.dto.response.mediator;


import lombok.*;
import lombok.experimental.FieldDefaults;
import lombok.experimental.SuperBuilder;
import server.dto.response.officer.OfficerResponse;
import server.entity.enums.OfficerStatus;

@Getter
@Setter
@NoArgsConstructor
@SuperBuilder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class MediatorResponse extends OfficerResponse {
    Long numberOfLegalCases;

    public MediatorResponse(String officerId, String lastName, String firstName, String fullName, OfficerStatus statusOfJudge, String email, Long numberOfLegalCases) {
        super(officerId, lastName, firstName, fullName, statusOfJudge, email);
        this.numberOfLegalCases = numberOfLegalCases;
    }
}
