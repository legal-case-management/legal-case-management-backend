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
import server.dto.response.judge.JudgeResponse;
import server.entity.*;
import server.entity.enums.Role;
import server.entity.enums.OfficerStatus;
import server.exception.AppException;
import server.exception.ErrorCode;
import server.mapper.JudgeMapper;
import server.repository.JudgeRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import server.repository.LegalRelationshipGroupRepository;
import server.utils.JudicialDate;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class JudgeService {
    JudgeRepository judgeRepository;
    LegalRelationshipGroupRepository legalRelationshipGroupRepository;

    JudgeMapper judgeMapper;

    AuthenticationService authenticationService;

    PasswordEncoder passwordEncoder;

    @Value("${auth.default-password}")
    @NonFinal
    String DEFAULT_PASSWORD;

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER', 'JUDGE')")
    public List<JudgeResponse> getAll() {
        return judgeRepository.getAllRaw(JudicialDate.getMilestoneDateTime())
                .stream()
                .map(judgeMapper::toJudgeResponse)
                .toList();
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public List<JudgeResponse> listAssignment(String legalRelationshipGroupId) {
        LegalRelationshipGroup legalRelationshipGroup = legalRelationshipGroupRepository
                .findById(legalRelationshipGroupId)
                .orElseThrow(() -> new AppException(ErrorCode.LEGAL_RELATIONSHIP_GROUP_NOT_EXISTED));

        return judgeRepository.getAssignAssignmentRaw(JudicialDate.getMilestoneDateTime(), legalRelationshipGroup)
                .stream()
                .map(judgeMapper::toJudgeResponse)
                .peek(judgeResponse -> judgeResponse.setRestrictedGroups(
                        legalRelationshipGroupRepository.getRestrictedGroupsByJudgeId(judgeResponse.getOfficerId())
                        )
                )
                .toList();
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public PageResponse<JudgeResponse> search(JudgeSearchRequest request, int page, int size, String sortBy) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(sortBy).ascending());
        Page<JudgeResponse> resultPage = judgeRepository.search(
                request.getOfficerId(),
                request.getFullName(),
                request.getOfficerStatus(),
                JudicialDate.getMilestoneDateTime(),
                pageable
        );

        return PageResponse.<JudgeResponse>builder()
                .number(resultPage.getNumber())
                .size(resultPage.getSize())
                .numberOfElement(resultPage.getNumberOfElements())
                .totalElements(resultPage.getTotalElements())
                .totalPages(resultPage.getTotalPages())
                .hasNext(resultPage.hasNext())
                .hasPrevious(resultPage.hasPrevious())
                .isFirst(resultPage.isFirst())
                .isLast(resultPage.isLast())
                .content(resultPage.getContent())
                .build();
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
        Judge judgeSaved = judgeRepository
                .findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.JUDGE_NOT_EXISTED));

        List<LegalRelationshipGroup> restrictedGroups = legalRelationshipGroupRepository
                .findAllById(request.getRestrictedGroupIds());
        judgeSaved.setRestrictedGroups(restrictedGroups);

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
        judgeRepository.delete(judgeSaved);
    }
}