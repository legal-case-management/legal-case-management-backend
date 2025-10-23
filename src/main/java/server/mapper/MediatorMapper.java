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
    Gson GSON = new GsonBuilder()
            .registerTypeAdapter(LocalDate.class, new GsonDateAdapters.LocalDateAdapter())
            .registerTypeAdapter(LocalDateTime.class, new GsonDateAdapters.LocalDateTimeAdapter())
            .create();

    String[] MEDIATOR_RESPONSE_KEYS = {
            "officerId",
            "lastName",
            "firstName",
            "fullName",
            "officerStatus",
            "email",
            "totalCases",
            "inProcessCases",
    };

    Mediator toMediator(MediatorRequest request);
    void toMediator(MediatorRequest request, @MappingTarget Mediator mediator);

    default MediatorResponse toMediatorResponse(Object[] values) {
        if (values == null || MEDIATOR_RESPONSE_KEYS.length != values.length) {
            throw new IllegalArgumentException("Number of values does not match MediatorResponse keys.");
        }

        Map<String, Object> map = new HashMap<>();
        for (int i = 0; i < MEDIATOR_RESPONSE_KEYS.length; i++) {
            map.put(MEDIATOR_RESPONSE_KEYS[i], values[i]);
        }

        return GSON.fromJson(GSON.toJson(map), MediatorResponse.class);
    }

    default MediatorResponse toMediatorResponseBasic(Mediator mediator){
        return MediatorResponse.builder()
                .officerId(mediator.getOfficerId())
                .fullName(mediator.getFullName())
                .build();
    }
}
