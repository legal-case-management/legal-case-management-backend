package server.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;
import org.mapstruct.ReportingPolicy;
import server.dto.request.judge.JudgeRequest;
import server.dto.request.mediator.MediatorRequest;
import server.dto.response.judge.JudgeResponse;
import server.dto.response.mediator.MediatorResponse;
import server.entity.Judge;
import server.entity.Mediator;

@Mapper(
        componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE,
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE
)
public interface MediatorMapper {
    Mediator toMediator(MediatorRequest request);
    MediatorResponse toMediatorResponse(Mediator mediator);
    void updateMediatorFromRequest(MediatorRequest request, @MappingTarget Mediator mediator);
}
