package com.qlatakv9dt.mapper;

import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;
import com.qlatakv9dt.dto.request.authentication.AccountRequest;
import com.qlatakv9dt.dto.response.authentication.AccountResponse;
import com.qlatakv9dt.entity.Account;
import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;

@Mapper(
        componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE,
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE,
        uses = {RoleMapper.class}
)
public interface AccountMapper {
    // role được nạp thủ công trong AuthenticationService (từ roleId), nên bỏ qua khi map request -> entity.
    @Mapping(target = "role", ignore = true)
    Account toAccount(AccountRequest request);

    @Mapping(target = "role", ignore = true)
    void toAccount(AccountRequest request, @MappingTarget Account account);

    // role (entity) -> RoleResponse được map qua RoleMapper.
    AccountResponse toAccountResponse(Account account);
}
