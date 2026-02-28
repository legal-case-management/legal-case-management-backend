package server.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;
import org.mapstruct.ReportingPolicy;
import server.dto.request.decision.DecisionRequest;
import server.dto.response.decision.DecisionResponse;
import server.entity.Decision;
import server.utils.DateUtils;

@Mapper(
        componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE,
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE
)
public interface DecisionMapper {
    DecisionResponse toDecisionResponse(Decision decision);
    void toDecision(DecisionRequest request, @MappingTarget Decision decision);
    default String toDecisionInfo(Decision decision) {
        return String.format("%s-%s, %s", decision.getNumber(), DateUtils.formatLocalDate(decision.getReleaseDate()), decision.getDecisionType().getDecisionTypeName());
    }
}
