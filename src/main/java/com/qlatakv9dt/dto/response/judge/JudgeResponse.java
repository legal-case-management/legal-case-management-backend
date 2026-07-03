package com.qlatakv9dt.dto.response.judge;

import lombok.*;
import lombok.experimental.FieldDefaults;
import lombok.experimental.SuperBuilder;
import com.qlatakv9dt.dto.response.legalRelationshipGroup.LegalRelationshipGroupResponse;
import com.qlatakv9dt.dto.response.officer.OfficerResponse;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@SuperBuilder(toBuilder = true)
@FieldDefaults(level = AccessLevel.PRIVATE)
public class JudgeResponse extends OfficerResponse {
    Long maxWithMediator;
    Long maxWithoutMediator;
    List<LegalRelationshipGroupResponse> restrictedGroups;
}