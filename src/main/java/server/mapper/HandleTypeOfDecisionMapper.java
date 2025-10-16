package server.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;
import org.mapstruct.ReportingPolicy;
import server.dto.request.handleDecisionType.HandleDecisionTypeRequest;
import server.dto.response.handleTypeOfDecision.HandleTypeOfDecisionResponse;
import server.entity.HandleDecisionType;

@Mapper(
        componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE,
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE
)
public interface HandleTypeOfDecisionMapper {
    HandleTypeOfDecisionResponse toHandleTypeOfDecisionResponse(HandleDecisionType handleTypeOfDecision);
    void toHandleTypeOfDecision(HandleDecisionTypeRequest request, @MappingTarget HandleDecisionType handleTypeOfDecision);

}
