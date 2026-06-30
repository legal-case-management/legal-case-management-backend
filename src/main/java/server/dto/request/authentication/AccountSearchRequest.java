package server.dto.request.authentication;


import lombok.*;
import lombok.experimental.FieldDefaults;

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
    String roleId;
    String fullName;
}
