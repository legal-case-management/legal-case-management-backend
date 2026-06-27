package server.mapper;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;
import org.mapstruct.ReportingPolicy;
import server.dto.request.mediator.MediatorRequest;
import server.dto.response.judge.JudgeResponse;
import server.dto.response.mediator.MediatorResponse;
import server.entity.Mediator;
import server.utils.GsonDateAdapters;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

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
