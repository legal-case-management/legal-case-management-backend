package server.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;
import org.mapstruct.ReportingPolicy;
import server.dto.request.legalRelationshipGroup.LegalRelationshipGroupRequest;
import server.dto.response.legalRelationshipGroup.LegalRelationshipGroupResponse;
import server.entity.LegalRelationshipGroup;

@Mapper(
        componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE,
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE
)
public interface LegalRelationshipGroupMapper {
    LegalRelationshipGroupResponse toLegalRelationshipGroupResponse(LegalRelationshipGroup legalRelationshipGroup);
    void toLegalRelationshipGroup(LegalRelationshipGroupRequest request, @MappingTarget LegalRelationshipGroup legalRelationshipGroup);
}
