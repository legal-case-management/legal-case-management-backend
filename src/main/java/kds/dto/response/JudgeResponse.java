package kds.dto.response;

import kds.dto.response.authentication.AccountResponse;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@JsonInclude(JsonInclude.Include.NON_NULL)
public class JudgeResponse {
    String personId;
    String name;
    LocalDate dateOfBirth;
    String citizenIdentificationId;
    String phone;
    String email;
    AccountResponse account;
    int intimacyPoints;
    CustomerType customerType;
//    List<Meeting> meetings;
}
