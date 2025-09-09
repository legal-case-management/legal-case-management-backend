package server.mapper;

import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;
import server.dto.request.authentication.AccountRequest;
import server.dto.request.judge.JudgeRequest;
import server.dto.request.typeOfLegalCase.TypeOfLegalCaseRequest;
import server.dto.response.authentication.AccountResponse;
import server.entity.Account;
import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;
import server.entity.TypeOfLegalCase;

@Mapper(
        componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE,
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE
)
public interface AccountMapper {
    Account toAccount(AccountRequest request);
    void toAccount(AccountRequest request, @MappingTarget Account account);
    AccountResponse toAccountResponse(Account account);
}
