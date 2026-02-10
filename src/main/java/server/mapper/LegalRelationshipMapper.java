package server.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;
import org.mapstruct.ReportingPolicy;
import server.dto.request.legalRelationship.LegalRelationshipRequest;
import server.dto.response.legalRelationship.LegalRelationshipResponse;
import server.entity.LegalRelationship;

@Mapper(
        componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE,
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE
)
public interface LegalRelationshipMapper {
    LegalRelationshipResponse toLegalRelationshipResponse(LegalRelationship legalRelationship);
    void toLegalRelationship(LegalRelationshipRequest request, @MappingTarget LegalRelationship legalRelationship);
}
