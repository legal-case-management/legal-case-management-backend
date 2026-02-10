package server.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;
import org.mapstruct.ReportingPolicy;
import server.dto.request.legalCaseType.LegalCaseTypeRequest;
import server.dto.response.legalCaseType.LegalCaseTypeResponse;
import server.entity.LegalCaseType;

@Mapper(
        componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE,
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE
)
public interface LegalCaseTypeMapper {
    LegalCaseTypeResponse toLegalCaseTypeResponse(LegalCaseType legalCaseType);
    void toLegalCaseType(LegalCaseTypeRequest request, @MappingTarget LegalCaseType legalCaseType);
}