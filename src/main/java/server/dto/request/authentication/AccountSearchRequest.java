package server.dto.request.authentication;


import lombok.*;
import lombok.experimental.FieldDefaults;
import server.entity.enums.Role;
import server.entity.enums.AccountStatus;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class AccountSearchRequest {
    String username;
    String email;
    Role role;
    AccountStatus accountStatus;
    String fullName;
}
