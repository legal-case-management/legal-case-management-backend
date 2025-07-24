package kds.dto.request.authentication;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class JudgeCreateRequest {
    String username;
    String password;
    String fistName;
    String lastName;
    long maxNumberOfLegalCase;
}