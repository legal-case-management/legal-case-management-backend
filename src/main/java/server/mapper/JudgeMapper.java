package server.mapper;


import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;
import server.dto.response.judge.JudgeAssignmentInfoResponse;
import server.dto.request.judge.JudgeRequest;
import server.dto.response.judge.JudgeResponse;
import server.dto.response.legalCase.LegalCaseResponse;
import server.entity.Judge;
import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;
import server.entity.LegalCase;
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
public interface JudgeMapper {
    Gson GSON = new GsonBuilder()
            .registerTypeAdapter(LocalDate.class, new GsonDateAdapters.LocalDateAdapter())
            .registerTypeAdapter(LocalDateTime.class, new GsonDateAdapters.LocalDateTimeAdapter())
            .create();

    String[] JUDGE_RESPONSE_KEYS = {
            "officerId",
            "fullName",
            "officerStatus",
            "maxByCondition",
            "numberByCondition"
    };

    Judge toJudge(JudgeRequest request);
    void toJudge(JudgeRequest request, @MappingTarget Judge judge);

    default JudgeAssignmentInfoResponse toJudgeAssignmentInfo(Object[] values) {
        if (values == null || JUDGE_RESPONSE_KEYS.length != values.length) {
            throw new IllegalArgumentException("Number of values does not match JudgeAssignmentInfo keys.");
        }

        Map<String, Object> map = new HashMap<>();
        for (int i = 0; i < JUDGE_RESPONSE_KEYS.length; i++) {
            map.put(JUDGE_RESPONSE_KEYS[i], values[i]);
        }

        return GSON.fromJson(GSON.toJson(map), JudgeAssignmentInfoResponse.class);
    }

    JudgeResponse toJudgeResponse(Judge judge);

    default JudgeResponse toJudgeResponseBasic(Judge judge){
        return JudgeResponse.builder()
                .officerId(judge.getOfficerId())
                .fullName(judge.getFullName())
                .build();
    }
}

