package server.service;

import server.dto.response.JudgeResponse;
import server.exception.AppException;
import server.exception.ErrorCode;
import server.mapper.AccountMapper;
import server.mapper.JudgeMapper;
import server.repository.AccountRepository;
import server.repository.JudgeRepository;
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
