package server.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;
import org.mapstruct.ReportingPolicy;
import server.dto.request.decisionType.DecisionTypeRequest;
import server.dto.response.decisionType.DecisionTypeResponse;
import server.entity.DecisionType;

@Mapper(
        componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE,
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE
)
public interface DecisionTypeMapper {
    DecisionTypeResponse toDecisionTypeResponse(DecisionType decisionType);
    void toDecisionType(DecisionTypeRequest request, @MappingTarget DecisionType decisionType);
}
