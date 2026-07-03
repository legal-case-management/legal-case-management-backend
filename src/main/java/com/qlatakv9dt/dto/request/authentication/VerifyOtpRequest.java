package com.qlatakv9dt.dto.request.authentication;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class VerifyOtpRequest {
    String email;
    String otp;
}
