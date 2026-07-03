package com.qlatakv9dt.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;
import org.mapstruct.ReportingPolicy;
import com.qlatakv9dt.dto.request.legalCaseType.LegalCaseTypeRequest;
import com.qlatakv9dt.dto.response.legalCaseType.LegalCaseTypeResponse;
import com.qlatakv9dt.entity.LegalCaseType;

@Mapper(
        componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE,
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE
)
public interface LegalCaseTypeMapper {
    LegalCaseTypeResponse toLegalCaseTypeResponse(LegalCaseType legalCaseType);
    void toLegalCaseType(LegalCaseTypeRequest request, @MappingTarget LegalCaseType legalCaseType);
}