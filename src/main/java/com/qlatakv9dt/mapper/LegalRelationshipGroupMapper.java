package com.qlatakv9dt.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;
import org.mapstruct.ReportingPolicy;
import com.qlatakv9dt.dto.request.legalRelationshipGroup.LegalRelationshipGroupRequest;
import com.qlatakv9dt.dto.response.legalRelationshipGroup.LegalRelationshipGroupResponse;
import com.qlatakv9dt.entity.LegalRelationshipGroup;

@Mapper(
        componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE,
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE
)
public interface LegalRelationshipGroupMapper {
    LegalRelationshipGroupResponse toLegalRelationshipGroupResponse(LegalRelationshipGroup legalRelationshipGroup);
    void toLegalRelationshipGroup(LegalRelationshipGroupRequest request, @MappingTarget LegalRelationshipGroup legalRelationshipGroup);
}
