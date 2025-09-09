package server.dto.request.judge;

import lombok.*;
import lombok.experimental.FieldDefaults;
import lombok.experimental.SuperBuilder;
import server.dto.request.officer.OfficerRequest;
import server.dto.request.officer.OfficerSearchRequest;
import server.entity.enums.StatusOfOfficer;

@Getter
@Setter
@NoArgsConstructor
@SuperBuilder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class JudgeSearchRequest extends OfficerSearchRequest {

}
