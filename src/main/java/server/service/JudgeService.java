package server.service;

import lombok.Synchronized;
import lombok.experimental.NonFinal;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.annotation.Transactional;
import server.dto.request.judge.JudgeRequest;
import server.dto.request.judge.JudgeSearchRequest;
import server.dto.response.PageResponse;
import server.dto.response.judge.JudgeAssignmentInfoResponse;
import server.dto.response.judge.JudgeResponse;
import server.entity.*;
import server.enums.Role;
import server.enums.OfficerStatus;
import server.exception.AppException;
import server.exception.ErrorCode;
import server.mapper.JudgeMapper;
import server.mapper.LegalRelationshipGroupMapper;
import server.mapper.PageMapper;
import server.repository.JudgeRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import server.repository.LegalCaseRepository;
import server.repository.LegalRelationshipGroupRepository;
import server.utils.DateUtils;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class JudgeService {
    JudgeRepository judgeRepository;
    LegalCaseRepository legalCaseRepository;
    LegalRelationshipGroupRepository legalRelationshipGroupRepository;

    JudgeMapper judgeMapper;
    LegalRelationshipGroupMapper legalRelationshipGroupMapper;
    PageMapper pageMapper;

    AuthenticationService authenticationService;

    PasswordEncoder passwordEncoder;

    @Value("${auth.default-password}")
    @NonFinal
    String DEFAULT_PASSWORD;

    public List<JudgeResponse> getAll() {
        return judgeRepository.findAll(Sort.by("officerId"))
                .stream()
                .map(judgeMapper::toJudgeResponseBasic)
                .toList();
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public List<JudgeAssignmentInfoResponse> listAssignment(String legalRelationshipGroupId) {
        boolean isMediator = legalRelationshipGroupId == null;
        if (isMediator) {
            return judgeRepository.getAssignAssignmentWithMediatorRaw(
                            DateUtils.getMilestoneStartDate(),
                            DateUtils.getMilestoneEndDate()
                    )
                    .stream()
                    .map(judgeMapper::toJudgeAssignmentInfo)
                    .toList();
        }
        LegalRelationshipGroup legalRelationshipGroup = legalRelationshipGroupRepository.findById(legalRelationshipGroupId)
                  .orElseThrow(() -> new AppException(ErrorCode.LEGAL_RELATIONSHIP_GROUP_NOT_EXISTED));

        return judgeRepository.getAssignAssignmentWithoutMediatorRaw(
                        DateUtils.getMilestoneStartDate(),
                        DateUtils.getMilestoneEndDate(),
                        legalRelationshipGroup
                )
                .stream()
                .map(judgeMapper::toJudgeAssignmentInfo)
                .toList();
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public PageResponse<JudgeResponse> search(JudgeSearchRequest request, int page, int size, String sortBy) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(sortBy).ascending());
        Page<JudgeResponse> resultPage = judgeRepository.search(
                request.getOfficerId(),
                request.getFullName(),
                request.getOfficerStatus(),
                pageable
        ).map(judgeMapper::toJudgeResponse);

        return pageMapper.map(resultPage);
    }


    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void create(JudgeRequest request) {
        Judge judge = judgeMapper.toJudge(request);

        Integer judgeNumberOfId = judgeRepository.getMaxId()
                .orElse(0);
        String judgeId = String.format("%s%02d", "TP", judgeNumberOfId + 1);
        if (judgeRepository.existsById(judgeId)) {
            throw new AppException(ErrorCode.JUDGE_EXISTED);
        }

        judge.setOfficerId(judgeId);

        judge.setOfficerStatus(OfficerStatus.WORKING);

        List<LegalRelationshipGroup> restrictedGroups = legalRelationshipGroupRepository
                .findAllById(request.getRestrictedGroupIds());
        judge.setRestrictedGroups(restrictedGroups);

        Judge judgeSaved = judgeRepository.save(judge);

        Account account = Account.builder()
                .username(judgeSaved.getOfficerId())
                .email(request.getEmail())
                .password(passwordEncoder.encode(DEFAULT_PASSWORD))
                .officer(judgeSaved)
                .role(Role.JUDGE)
                .build();

        authenticationService.createAccount(account);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void update(String id, JudgeRequest request) {
        Judge judgeSaved = judgeRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.JUDGE_NOT_EXISTED));

        if (request.getRestrictedGroupIds() != null) {
            List<LegalRelationshipGroup> restrictedGroups = legalRelationshipGroupRepository
                    .findAllById(request.getRestrictedGroupIds());
            judgeSaved.setRestrictedGroups(restrictedGroups);
        }

        judgeMapper.toJudge(request, judgeSaved);
        judgeRepository.save(judgeSaved);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void delete(String id) {
        Judge judgeSaved = judgeRepository
                .findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.JUDGE_NOT_EXISTED));
        long numberLegalCase = legalCaseRepository.countLegalCasesByJudge(judgeSaved);
        if (numberLegalCase > 0) {
            throw new AppException(ErrorCode.JUDGE_ASSIGNED_TO_LEGAL_CASE);
        }
        judgeRepository.delete(judgeSaved);
    }
}