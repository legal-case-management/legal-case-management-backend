package com.qlatakv9dt.dto.request.authentication;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class LoginRequest {
    String identifier;
    String password;
    /** "MOBILE" hoặc "WEB" (mặc định); quyết định thời hạn refreshToken cấp cho phiên này. */
    String clientType;
}
