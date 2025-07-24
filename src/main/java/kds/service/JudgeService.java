package kds.service;

import kds.dto.response.JudgeResponse;
import kds.exception.AppException;
import kds.exception.ErrorCode;
import kds.mapper.AccountMapper;
import kds.mapper.JudgeMapper;
import kds.repository.AccountRepository;
import kds.repository.JudgeRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class JudgeService {
    AccountRepository accountRepository;
    JudgeRepository judgeRepository;
    JudgeMapper judgeMapper;
    AccountMapper accountMapper;

    @PreAuthorize("hasRole('ADMIN')")
    public List<JudgeResponse> getAll() {
        return judgeRepository
                .findAll()
                .stream().map(judgeMapper::toJudgeResponse)
                .toList();
    }


    public JudgeResponse getMyInfo() {
        SecurityContext context = SecurityContextHolder.getContext();
        String accountId = context.getAuthentication().getName();

        return judgeMapper.toJudgeResponse(
                judgeRepository
                        .findByAccount_AccountId(accountId)
                        .orElseThrow(() -> new AppException(ErrorCode.ACCOUNT_NOT_EXISTED))
        );
    }
}
