package server.dto.response.typeOfLegalCase;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class TypeOfLegalCaseResponse {
    String typeOfLegalCaseId;
    String typeOfLegalCaseName;
    String codeName;
}
