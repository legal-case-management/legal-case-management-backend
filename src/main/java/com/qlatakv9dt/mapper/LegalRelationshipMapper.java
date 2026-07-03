package com.qlatakv9dt.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;
import org.mapstruct.ReportingPolicy;
import com.qlatakv9dt.dto.request.legalRelationship.LegalRelationshipRequest;
import com.qlatakv9dt.dto.response.legalRelationship.LegalRelationshipResponse;
import com.qlatakv9dt.entity.LegalRelationship;

@Mapper(
        componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE,
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE
)
public interface LegalRelationshipMapper {
    LegalRelationshipResponse toLegalRelationshipResponse(LegalRelationship legalRelationship);
    void toLegalRelationship(LegalRelationshipRequest request, @MappingTarget LegalRelationship legalRelationship);
}
