package com.qlatakv9dt.mapper;

import org.mapstruct.*;
import com.qlatakv9dt.dto.request.legalCase.LegalCaseRequest;
import com.qlatakv9dt.dto.response.legalCase.LegalCaseResponse;
import com.qlatakv9dt.entity.LegalCase;

@Mapper(
        componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE,
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE
)
public interface LegalCaseMapper {
    LegalCaseResponse toLegalCaseResponse(LegalCase legalCase);
    void toLegalCase(LegalCaseRequest request, @MappingTarget LegalCase legalCase);
}
