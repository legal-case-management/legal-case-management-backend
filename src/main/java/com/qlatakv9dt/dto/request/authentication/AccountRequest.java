package com.qlatakv9dt.dto.request.authentication;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class AccountRequest {
    String username;
    String password;
    String email;
    String roleId;
    @JsonProperty("active")
    boolean active;
}
