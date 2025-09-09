package server.dto.response.authentication;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import server.entity.Officer;
import server.entity.enums.Role;

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
    Officer officer;
}
