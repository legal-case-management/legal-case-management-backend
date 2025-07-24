package kds.mapper;

import kds.dto.request.authentication.JudgeCreateRequest;
import kds.entity.Account;
import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;

@Mapper(componentModel = "spring", unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface AccountMapper {
    Account toAccount(JudgeCreateRequest request);
}
