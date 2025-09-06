package server.dto.request.mediator;


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
public class MediatorSearchRequest {
    String officerId;
    String fullName;
    StatusOfOfficer statusOfOfficer;
}
