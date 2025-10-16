package server.dto.response.authentication;

import lombok.*;
import lombok.experimental.FieldDefaults;
import server.dto.response.officer.OfficerResponse;
import server.entity.enums.Role;
import server.entity.enums.AccountStatus;

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
    AccountStatus statusOfAccount;
}
