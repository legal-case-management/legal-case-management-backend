package server.mapper;

import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;
import server.dto.request.JudgeRequest;
import server.dto.response.JudgeResponse;
import server.entity.Judge;
import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;

@Mapper(
        componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE,
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE
)
public interface JudgeMapper {
    Judge toJudge(JudgeRequest request);
    JudgeResponse toJudgeResponse(Judge judge);
    void updateJudgeFromRequest(JudgeRequest request, @MappingTarget Judge judge);
}
