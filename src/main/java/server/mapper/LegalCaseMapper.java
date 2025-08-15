package server.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;
import org.mapstruct.ReportingPolicy;
import server.dto.request.legalCase.LegalCaseRequest;
import server.dto.response.legalCase.LegalCaseResponse;
import server.entity.LegalCase;

@Mapper(
        componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE,
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE
)
public interface LegalCaseMapper {
    LegalCaseResponse toLegalCaseResponse(LegalCase legalCase);
    void toLegalCase(LegalCaseRequest request, @MappingTarget LegalCase legalCase);
}
