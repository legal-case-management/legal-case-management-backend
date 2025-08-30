package server.dto.request.authentication;

import lombok.*;
import lombok.experimental.FieldDefaults;
import server.entity.enums.Role;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class AccountRequest {
    String username;
    String password;
    String email;
    Role role;
}
