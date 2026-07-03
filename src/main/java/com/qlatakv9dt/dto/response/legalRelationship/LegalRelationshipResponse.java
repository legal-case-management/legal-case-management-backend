package com.qlatakv9dt.dto.response.legalRelationship;

import lombok.*;
import lombok.experimental.FieldDefaults;
import com.qlatakv9dt.dto.response.legalRelationshipGroup.LegalRelationshipGroupResponse;
import com.qlatakv9dt.dto.response.legalCaseType.LegalCaseTypeResponse;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class LegalRelationshipResponse {
    String legalRelationshipId;
    String legalRelationshipName;
    LegalCaseTypeResponse legalCaseType;
    LegalRelationshipGroupResponse legalRelationshipGroup;
}
