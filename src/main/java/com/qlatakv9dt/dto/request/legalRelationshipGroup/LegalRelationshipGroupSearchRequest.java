package com.qlatakv9dt.dto.request.legalRelationshipGroup;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class LegalRelationshipGroupSearchRequest {
    String legalRelationshipGroupId;
    String legalRelationshipGroupName;
}
