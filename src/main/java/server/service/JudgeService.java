package server.service;

import lombok.experimental.NonFinal;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.PageRequest;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.annotation.Transactional;
import server.dto.request.JudgeRequest;
import server.dto.request.JudgeSearchRequest;
import server.dto.response.JudgeResponse;
import server.entity.*;
import server.entity.enums.StatusOfJudge;
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

    AccountMapper accountMapper;
    JudgeMapper judgeMapper;

    PasswordEncoder passwordEncoder;

    @Value("${auth.default-password}")
    @NonFinal
    String DEFAULT_PASSWORD;

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public List<JudgeResponse> getAll() {
        return judgeRepository
                .findAll()
                .stream().map(judgeMapper::toJudgeResponse)
                .toList();
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public List<JudgeResponse> get50Judge() {
        return judgeRepository
                .get50Judge(PageRequest.of(0, 50));
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public List<JudgeResponse> search(JudgeSearchRequest request) {
        return judgeRepository.searchJudge(
                request.getJudgeId(),
                request.getFullName(),
                request.getStatusOfJudge()
        );
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

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    @Async
    @Transactional
    public void create(JudgeRequest request) {
        Judge judge = judgeMapper.toJudge(request);


        Integer judgeNumberOfId = judgeRepository.getMaxJudgeId()
                .orElse(0);
        String judgeId = String.format("%s%02d", "TP", judgeNumberOfId + 1);
        if (judgeRepository.existsById(judgeId)) {
            throw new AppException(ErrorCode.JUDGE_EXISTED);
        }

        judge.setJudgeId(judgeId);

        judge.setStatusOfJudge(StatusOfJudge.WORKING);
        Judge judgeSaved = judgeRepository.save(judge);

        Account account = accountMapper.toAccount(request);
        account.setUsername(judgeSaved.getJudgeId());
        account.setPassword(passwordEncoder.encode(DEFAULT_PASSWORD));
        account.setJudge(judgeSaved);
        accountRepository.save(account);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Transactional
    public void update(JudgeRequest request) {
        Judge judgeSaved = judgeRepository
                .findById(request.getJudgeId())
                .orElseThrow(() -> new AppException(ErrorCode.JUDGE_NOT_EXISTED));

        judgeMapper.updateJudgeFromRequest(request, judgeSaved);
        judgeRepository.save(judgeSaved);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Transactional
    public void delete(JudgeRequest request) {
        Judge judge = judgeRepository
                .findById(request.getJudgeId())
                .orElseThrow(() -> new AppException(ErrorCode.JUDGE_NOT_EXISTED));

        judgeRepository.deleteById(judge.getJudgeId());
    }
}
