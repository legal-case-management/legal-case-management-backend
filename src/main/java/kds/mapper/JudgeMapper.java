package kds.mapper;

import kds.dto.request.authentication.JudgeCreateRequest;
import kds.dto.response.JudgeResponse;
import kds.entity.enums.Judge;
import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;

@Mapper(componentModel = "spring", unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface JudgeMapper {
    Judge toJudge(JudgeCreateRequest request);
    JudgeResponse toJudgeResponse(Judge judge);
}
