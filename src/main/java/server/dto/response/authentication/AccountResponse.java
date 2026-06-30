package server.dto.response.authentication;

import lombok.*;
import lombok.experimental.FieldDefaults;
import server.dto.response.officer.OfficerResponse;
import server.dto.response.role.RoleResponse;

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
    RoleResponse role;
    OfficerResponse officer;
    boolean active;
}
