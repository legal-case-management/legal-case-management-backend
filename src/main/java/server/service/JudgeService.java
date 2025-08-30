package server.service;

import lombok.experimental.NonFinal;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.PageRequest;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.annotation.Transactional;
import server.dto.request.authentication.AccountRequest;
import server.dto.request.judge.JudgeRequest;
import server.dto.request.judge.JudgeSearchRequest;
import server.dto.response.judge.JudgeResponse;
import server.entity.*;
import server.entity.enums.Role;
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
    JudgeRepository judgeRepository;

    JudgeMapper judgeMapper;

    AuthenticationService authenticationService;

    PasswordEncoder passwordEncoder;

    @Value("${auth.default-password}")
    @NonFinal
    String DEFAULT_PASSWORD;

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public List<JudgeResponse> getAll() {
        return judgeRepository.getAll();
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public List<JudgeResponse> getTop50() {
        return judgeRepository
                .getTop50(PageRequest.of(0, 50));
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public List<JudgeResponse> search(JudgeSearchRequest request) {
        return judgeRepository.search(
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

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Transactional
    public void create(JudgeRequest request) {
        Judge judge = judgeMapper.toJudge(request);


        Integer judgeNumberOfId = judgeRepository.getMaxId()
                .orElse(0);
        String judgeId = String.format("%s%02d", "TP", judgeNumberOfId + 1);
        if (judgeRepository.existsById(judgeId)) {
            throw new AppException(ErrorCode.JUDGE_EXISTED);
        }

        judge.setJudgeId(judgeId);

        judge.setStatusOfJudge(StatusOfJudge.WORKING);
        Judge judgeSaved = judgeRepository.save(judge);

        Account account = Account.builder()
                .username(judgeSaved.getJudgeId())
                .email(request.getEmail())
                .password(passwordEncoder.encode(DEFAULT_PASSWORD))
                .judge(judgeSaved)
                .role(Role.JUDGE)
                .build();

        authenticationService.createAccount(account);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Transactional
    public void update(String id, JudgeRequest request) {
        Judge judgeSaved = judgeRepository
                .findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.JUDGE_NOT_EXISTED));

        judgeMapper.updateJudgeFromRequest(request, judgeSaved);
        judgeRepository.save(judgeSaved);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Transactional
    public void delete(String id) {
        Judge judge = judgeRepository
                .findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.JUDGE_NOT_EXISTED));

        judgeRepository.deleteById(judge.getJudgeId());
    }
}
