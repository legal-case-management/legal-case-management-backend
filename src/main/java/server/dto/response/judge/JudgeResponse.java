package server.dto.response.judge;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.*;
import lombok.experimental.FieldDefaults;
import lombok.experimental.SuperBuilder;
import server.dto.response.legalRelationshipGroup.LegalRelationshipGroupResponse;
import server.dto.response.officer.OfficerResponse;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@SuperBuilder(toBuilder = true)
@FieldDefaults(level = AccessLevel.PRIVATE)
public class JudgeResponse extends OfficerResponse {
    Long maxWithMediator;
    Long maxWithoutMediator;
    List<LegalRelationshipGroupResponse> restrictedGroups;
}