package server.dto.request.typeOfLegalCase;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class TypeOfLegalCaseSearchRequest {
    String typeOfLegalCaseId;
    String typeOfLegalCaseName;
    String codeName;
}
