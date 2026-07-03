package com.qlatakv9dt.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;
import org.mapstruct.ReportingPolicy;
import com.qlatakv9dt.dto.request.mediator.MediatorRequest;
import com.qlatakv9dt.dto.response.mediator.MediatorResponse;
import com.qlatakv9dt.entity.Mediator;

@Mapper(
        componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE,
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE
)
public interface MediatorMapper {
    MediatorResponse toMediatorResponse(Mediator mediator);
    Mediator toMediator(MediatorRequest request);
    void toMediator(MediatorRequest request, @MappingTarget Mediator mediator);

    default MediatorResponse toMediatorResponseBasic(Mediator mediator){
        return MediatorResponse.builder()
                .officerId(mediator.getOfficerId())
                .fullName(mediator.getFullName())
                .build();
    }
}
