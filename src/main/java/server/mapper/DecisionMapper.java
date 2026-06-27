package server.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;
import org.mapstruct.ReportingPolicy;
import server.dto.request.decision.DecisionRequest;
import server.dto.response.decision.DecisionResponse;
import server.entity.Decision;

@Mapper(
        componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE,
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE
)
public interface DecisionMapper {
    DecisionResponse toDecisionResponse(Decision decision);
    void toDecision(DecisionRequest request, @MappingTarget Decision decision);
}
