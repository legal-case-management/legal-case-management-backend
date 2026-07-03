package com.qlatakv9dt.dto.request.legalCase;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class AssignmentListRequest {
    String legalRelationshipGroupId;
}
