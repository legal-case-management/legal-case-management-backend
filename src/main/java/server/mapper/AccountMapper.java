package server.mapper;

import org.mapstruct.NullValuePropertyMappingStrategy;
import server.dto.request.authentication.AccountRequest;
import server.dto.request.judge.JudgeRequest;
import server.entity.Account;
import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;

@Mapper(
        componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE,
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE
)
public interface AccountMapper {
    Account toAccount(JudgeRequest request);
    Account toAccount(AccountRequest request);
}
