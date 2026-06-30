package server.dto.request.authentication;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class RefreshTokenRequest {
    /**
     * Giữ lại để tương thích ngược; client mới nên dùng refreshToken.
     */
    String token;
    String refreshToken;

    /** Ưu tiên refreshToken, fallback về token (client cũ). */
    public String resolveRefreshToken() {
        return (refreshToken != null && !refreshToken.isBlank()) ? refreshToken : token;
    }
}
