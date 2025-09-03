package server.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;
import org.mapstruct.ReportingPolicy;
import server.dto.request.typeOfDecision.TypeOfDecisionRequest;
import server.dto.request.typeOfLegalCase.TypeOfLegalCaseRequest;
import server.dto.response.typeOfDecision.TypeOfDecisionResponse;
import server.dto.response.typeOfLegalCase.TypeOfLegalCaseResponse;
import server.entity.TypeOfDecision;
import server.entity.TypeOfLegalCase;

@Mapper(
        componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE,
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE
)
public interface TypeOfDecisionMapper {
    TypeOfDecisionResponse toTypeOfDecisionResponse(TypeOfDecision typeOfDecision);
    void toTypeOfDecision(TypeOfDecisionRequest request, @MappingTarget TypeOfDecision typeOfLegalCase);

}
