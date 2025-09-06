package server.dto.response.mediator;


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
public class MediatorResponse {
    String officerId;
    String firstName;
    String lastName;
    String fullName;
    long numberOfLegalCases;
    StatusOfOfficer statusOfOfficer;
    String email;
}
