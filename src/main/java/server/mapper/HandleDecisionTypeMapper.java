package server.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;
import org.mapstruct.ReportingPolicy;
import server.dto.request.handleDecisionType.HandleDecisionTypeRequest;
import server.dto.response.handleDecisionType.HandleDecisionTypeResponse;
import server.entity.HandleDecisionType;

@Mapper(
        componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE,
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE
)
public interface HandleDecisionTypeMapper {
    HandleDecisionTypeResponse toHandleDecisionTypeResponse(HandleDecisionType handleDecisionType);
    void toHandleDecisionType(HandleDecisionTypeRequest request, @MappingTarget HandleDecisionType handleDecisionType);
}