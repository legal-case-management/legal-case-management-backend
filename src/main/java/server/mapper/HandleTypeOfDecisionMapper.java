package server.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;
import org.mapstruct.ReportingPolicy;
import server.dto.request.handleTypeOfDecision.HandleTypeOfDecisionRequest;
import server.dto.request.typeOfLegalCase.TypeOfLegalCaseRequest;
import server.dto.response.handleTypeOfDecision.HandleTypeOfDecisionResponse;
import server.dto.response.typeOfLegalCase.TypeOfLegalCaseResponse;
import server.entity.HandleTypeOfDecision;
import server.entity.TypeOfLegalCase;

@Mapper(
        componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE,
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE
)
public interface HandleTypeOfDecisionMapper {
    HandleTypeOfDecisionResponse toHandleTypeOfDecisionResponse(HandleTypeOfDecision handleTypeOfDecision);
    void toHandleTypeOfDecision(HandleTypeOfDecisionRequest request, @MappingTarget HandleTypeOfDecision handleTypeOfDecision);

}
