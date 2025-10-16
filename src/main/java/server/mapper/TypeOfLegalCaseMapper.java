package server.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;
import org.mapstruct.ReportingPolicy;
import server.dto.request.legalCaseType.LegalCaseTypeRequest;
import server.dto.response.typeOfLegalCase.TypeOfLegalCaseResponse;
import server.entity.LegalCaseType;

@Mapper(
        componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE,
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE
)
public interface TypeOfLegalCaseMapper {
    TypeOfLegalCaseResponse toTypeOfLegalCaseResponse(LegalCaseType typeOfLegalCase);
    void toTypeOfLegalCase(LegalCaseTypeRequest request, @MappingTarget LegalCaseType typeOfLegalCase);
}