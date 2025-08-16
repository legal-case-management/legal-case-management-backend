package server.dto.request.legalRelationship;

import jakarta.persistence.Column;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.*;
import lombok.experimental.FieldDefaults;
import server.entity.TypeOfLegalCase;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class LegalRelationshipRequest {
    String legalRelationshipName;
    TypeOfLegalCase typeOfLegalCase;
    String typeOfLegalCaseId;
    String legalRelationshipGroupId;
}
