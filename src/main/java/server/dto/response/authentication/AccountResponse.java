package server.dto.response.authentication;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import server.dto.response.officer.OfficerResponse;
import server.entity.Officer;
import server.entity.enums.Role;
import server.entity.enums.StatusOfAccount;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class AccountResponse {
    String accountId;
    String username;
    String email;
    Role role;
    OfficerResponse officer;
    StatusOfAccount statusOfAccount;
}
