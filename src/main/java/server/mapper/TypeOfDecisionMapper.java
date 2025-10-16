package server.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;
import org.mapstruct.ReportingPolicy;
import server.dto.request.decisionType.DecisionTypeRequest;
import server.dto.response.typeOfDecision.TypeOfDecisionResponse;
import server.entity.DecisionType;

@Mapper(
        componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE,
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE
)
public interface TypeOfDecisionMapper {
    TypeOfDecisionResponse toTypeOfDecisionResponse(DecisionType typeOfDecision);
    void toTypeOfDecision(DecisionTypeRequest request, @MappingTarget DecisionType typeOfLegalCase);

}
