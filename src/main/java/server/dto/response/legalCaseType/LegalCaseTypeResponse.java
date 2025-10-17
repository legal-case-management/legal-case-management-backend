package server.dto.response.legalCaseType;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class LegalCaseTypeResponse {
    String legalCaseTypeId;
    String legalCaseTypeName;
    String codeName;
}
