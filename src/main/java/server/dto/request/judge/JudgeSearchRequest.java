package server.dto.request.judge;

import lombok.*;
import lombok.experimental.FieldDefaults;
import server.entity.enums.StatusOfOfficer;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class JudgeSearchRequest {
    String officerId;
    String fullName;
    StatusOfOfficer statusOfOfficer;
}
