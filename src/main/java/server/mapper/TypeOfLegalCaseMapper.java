package server.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;
import org.mapstruct.ReportingPolicy;
import server.dto.request.typeOfLegalCase.TypeOfLegalCaseRequest;
import server.dto.response.typeOfLegalCase.TypeOfLegalCaseResponse;
import server.entity.TypeOfLegalCase;

@Mapper(
        componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE,
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE
)
public interface TypeOfLegalCaseMapper {
    TypeOfLegalCaseResponse toTypeOfLegalCaseResponse(TypeOfLegalCase typeOfLegalCase);
    void toTypeOfLegalCase(TypeOfLegalCaseRequest request, @MappingTarget TypeOfLegalCase typeOfLegalCase);
}