package server.dto.request.authentication;


import lombok.*;
import lombok.experimental.FieldDefaults;
import server.enums.Role;

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
    String fullName;
}
