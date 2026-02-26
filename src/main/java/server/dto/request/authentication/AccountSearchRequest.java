package server.dto.request.authentication;


import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;
import lombok.experimental.FieldDefaults;
import server.entity.enums.Role;

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
    @JsonProperty("isActive")
    boolean isActive;
}
