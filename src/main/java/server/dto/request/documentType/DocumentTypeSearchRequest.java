package server.dto.request.documentType;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class DocumentTypeSearchRequest {
    String documentTypeId;
    String documentTypeName;
    String legalCaseTypeId;
}
