package server.mapper;

import org.mapstruct.*;
import server.dto.request.legalCase.LegalCaseRequest;
import server.dto.request.legalCase.LegalCasesRequest;
import server.dto.response.legalCase.LegalCaseResponse;
import server.entity.LegalCase;

import java.util.List;

@Mapper(
        componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE,
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE
)
public interface LegalCaseMapper {
    LegalCaseResponse toLegalCaseResponse(LegalCase legalCase);
    void toLegalCase(LegalCaseRequest request, @MappingTarget LegalCase legalCase);
}
