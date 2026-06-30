package server.dto.response.authentication;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class AuthenticationResponse {
    boolean authenticated;
    /**
     * Giữ lại để tương thích ngược với client cũ (bằng accessToken).
     */
    String token;
    String accessToken;
    String refreshToken;
}
