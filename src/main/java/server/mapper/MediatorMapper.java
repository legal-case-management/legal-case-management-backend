package server.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;
import org.mapstruct.ReportingPolicy;
import server.dto.request.mediator.MediatorRequest;
import server.dto.response.mediator.MediatorResponse;
import server.entity.Mediator;

@Mapper(
        componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE,
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE
)
public interface MediatorMapper {
    MediatorResponse toMediatorResponse(Mediator mediator);
    Mediator toMediator(MediatorRequest request);
    void toMediator(MediatorRequest request, @MappingTarget Mediator mediator);
}
