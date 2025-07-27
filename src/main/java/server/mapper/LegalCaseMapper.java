package server.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;
import server.dto.response.LegalCaseResponse;
import server.entity.LegalCase;

@Mapper(componentModel = "spring", unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface LegalCaseMapper {
    LegalCaseResponse toLegalCaseResponse(LegalCase legalCase);
}
