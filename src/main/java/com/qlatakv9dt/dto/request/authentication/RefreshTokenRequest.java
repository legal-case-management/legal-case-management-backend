package com.qlatakv9dt.dto.request.authentication;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class RefreshTokenRequest {
    String accessToken;
    String refreshToken;
    public String resolveRefreshToken() {
        return (refreshToken != null && !refreshToken.isBlank()) ? refreshToken : accessToken;
    }
}
