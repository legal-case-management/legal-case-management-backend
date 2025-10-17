package server.service;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.Synchronized;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import server.dto.request.legalCase.*;
import server.dto.response.PageResponse;
import server.dto.response.judge.JudgeResponse;
import server.dto.response.legalCase.LegalCaseResponse;
import server.entity.*;
import server.entity.enums.Assignment;
import server.entity.enums.LegalCaseStatus;
import server.exception.AppException;
import server.exception.ErrorCode;
import server.mapper.LegalCaseMapper;
import server.repository.*;
import server.utils.DateUtil;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class LegalCaseService {
    LegalCaseRepository legalCaseRepository;
    LegalRelationshipRepository legalRelationshipRepository;
    LegalRelationshipGroupRepository legalRelationshipGroupRepository;
    LegalCaseTypeRepository typeOfLegalCaseRepository;

    JudgeRepository judgeRepository;
    BatchRepository batchRepository;
    MediatorRepository mediatorRepository;

    LegalCaseMapper legalCaseMapper;


    public List<LegalCaseResponse> getAll() {
        return legalCaseRepository
                .findAll()
                .stream().map(legalCaseMapper::toLegalCaseResponse)
                .toList();
    }

    public PageResponse<LegalCaseResponse> search(LegalCaseSearchRequest request, int page, int size, String sortBy) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(sortBy).descending());
        Page<LegalCaseResponse> resultPage = legalCaseRepository.search(
                request.getAcceptanceNumber(),
                request.getStartAcceptanceDate(),
                request.getEndAcceptanceDate(),
                request.getPlaintiff(),
                request.getPlaintiffAddress(),
                request.getDefendant(),
                request.getDefendantAddress(),
                request.getLegalRelationshipId(),
                request.getTypeOfLegalCaseId(),
                request.getLegalRelationshipGroupId(),
                request.getStatusOfLegalCase(),
                request.getJudgeId(),
                request.getBatchId(),
                request.getStartStorageDate(),
                request.getEndStorageDate(),
                pageable
        ).map(legalCaseMapper::toLegalCaseResponse);

        return PageResponse.<LegalCaseResponse>builder()
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

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    @Async
    @Synchronized
    @Transactional
    public void create(LegalCaseRequest request) {
        Batch batch = batchRepository.findById(request.getBatchId())
                .orElseThrow(() -> new AppException(ErrorCode.BATCH_NOT_EXISTED));

        createSingle(request, batch);
    }

    public LegalCaseResponse getById(String id) {
        return legalCaseRepository.findById(id)
                .map(legalCaseMapper::toLegalCaseResponse)
                .orElseThrow(() -> new AppException(ErrorCode.LEGAL_CASE_NOT_EXISTED));
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    @Async
    @Synchronized
    @Transactional
    public void importFromExcel(LegalCasesRequest request) {
        Batch batch = batchRepository.findById(request.getBatchId())
                .orElseThrow(() -> new AppException(ErrorCode.BATCH_NOT_EXISTED));

        for (LegalCaseRequest legalCaseRequest : request.getLegalCases()) {
            createSingle(legalCaseRequest, batch);
        }
    }

    private void createSingle(LegalCaseRequest request, Batch batch) {
        LegalCase legalCase = LegalCase.builder().build();
        legalCaseMapper.toLegalCase(request, legalCase);

        LegalRelationship legalRelationship = legalRelationshipRepository.findById(request.getLegalRelationshipId())
                .orElseThrow(() -> new AppException(ErrorCode.LEGAL_RELATIONSHIP_NOT_EXISTED));

        Integer legalCaseMaxNumberOfId = legalCaseRepository.getMaxId(
                String.format("%04d", legalCase.getAcceptanceDate().getYear()),
                legalRelationship.getLegalCaseType().getCodeName()
        ).orElse(0);

        String legalCaseId = String.format(
                "%04d%s%04d",
                legalCase.getAcceptanceDate().getYear(),
                legalRelationship.getLegalCaseType().getCodeName(),
                legalCaseMaxNumberOfId + 1
        );
        if (legalCaseRepository.existsById(legalCaseId)) {
            throw new AppException(ErrorCode.LEGAL_CASE_EXISTED);
        }

        legalCase.setLegalCaseId(legalCaseId);
        legalCase.setStorageDate(LocalDateTime.now());
        legalCase.setLegalRelationship(legalRelationship);

        if (legalCase.getStatusOfLegalCase() == null)
            legalCase.setStatusOfLegalCase(LegalCaseStatus.WAITING_FOR_ASSIGNMENT);

        if (request.getJudgeId() != null) {
            Judge existingJudge = judgeRepository.findById(request.getJudgeId())
                    .orElseThrow(() -> new AppException(ErrorCode.JUDGE_NOT_EXISTED));
            legalCase.setJudge(existingJudge);
            legalCase.setAssignment(Assignment.ASSIGN);
            legalCase.setAssignmentDate(LocalDateTime.now());

            LegalCaseType typeOfLegalCase = typeOfLegalCaseRepository.findById(legalRelationship.getLegalCaseType().getTypeOfLegalCaseId())
                    .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_NOT_EXISTED));

            legalCase.setExpiredDate(
                    typeOfLegalCase.getCodeName().equals("HS")
                            ? legalCase.getAcceptanceDate().plusMonths(2)
                            : legalCase.getAcceptanceDate().plusMonths(4)
            );
        }

        if (request.getMediatorId() != null) {
            Mediator existingMediator = mediatorRepository.findById(request.getMediatorId())
                    .orElseThrow(() -> new AppException(ErrorCode.MEDIATOR_NOT_EXISTED));
            legalCase.setMediator(existingMediator);
        }

        if (batch != null)
            legalCase.setBatch(batch);

        legalCaseRepository.save(legalCase);
    }


    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void update(String id, LegalCaseRequest request) {
        LegalCase legalCaseSaved = legalCaseRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.LEGAL_CASE_NOT_EXISTED));

        legalCaseMapper.toLegalCase(request, legalCaseSaved);
        if (request.getLegalRelationshipId() != null) {
            LegalRelationship legalRelationship = legalRelationshipRepository.findById(request.getLegalRelationshipId())
                    .orElseThrow(() -> new AppException(ErrorCode.LEGAL_RELATIONSHIP_NOT_EXISTED));
            legalCaseSaved.setLegalRelationship(legalRelationship);
        }

        if (request.getJudgeId() != null) {
            Judge existingJudge = judgeRepository.findById(request.getJudgeId())
                    .orElseThrow(() -> new AppException(ErrorCode.JUDGE_NOT_EXISTED));
            legalCaseSaved.setJudge(existingJudge);
        } else {
            legalCaseSaved.setJudge(null);
        }

        if (request.getMediatorId() != null) {
            Mediator existingMediator = mediatorRepository.findById(request.getMediatorId())
                    .orElseThrow(() -> new AppException(ErrorCode.MEDIATOR_NOT_EXISTED));
            legalCaseSaved.setMediator(existingMediator);
        } else {
            legalCaseSaved.setMediator(null);
        }

        if (request.getAcceptanceDate() != null
                && !legalCaseSaved.getStatusOfLegalCase().equals(LegalCaseStatus.WAITING_FOR_ASSIGNMENT)
                && legalCaseSaved.getDecisions().isEmpty()
        ) {
            LocalDate expiredDate = legalCaseSaved.getAcceptanceDate().plusMonths(4);
            legalCaseSaved.setExpiredDate(expiredDate);
        }

        legalCaseRepository.save(legalCaseSaved);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void delete(String id) {
        LegalCase legalCaseSaved = legalCaseRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.LEGAL_CASE_NOT_EXISTED));
        legalCaseRepository.delete(legalCaseSaved);
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    @Async
    @Synchronized
    @Transactional
    public void randomAssignment(RandomAssignmentRequest request) {
        if (request == null) {
            throw new AppException(ErrorCode.RANDOM_ASSIGNMENT_FAILED);
        }

        // Lấy danh sách thẩm phán
        List<JudgeResponse> judges = judgeRepository.getAssignAssignment(DateUtil.getMilestoneDateTime());
        if (judges.isEmpty()) {
            throw new AppException(ErrorCode.NO_JUDGES_AVAILABLE);
        }

        // Lấy danh sách vụ án
        List<LegalCase> legalCases = legalCaseRepository.getAssignAssignment(request.getLegalCaseIds());
        if (legalCases.isEmpty()) {
            throw new AppException(ErrorCode.NO_LEGAL_CASES_FOUND);
        }

        Random random = new Random();
        int judgeIndex = 0;

        while (!legalCases.isEmpty()) {
            JudgeResponse judge = judges.get(judgeIndex);
            long currentCases = judge.getNumberOfLegalCase();
            long maxCases = judge.getMaxNumberOfLegalCase();

            if (maxCases == -1 || currentCases < maxCases) {
                int caseIndex = random.nextInt(legalCases.size());
                LegalCase legalCase = legalCases.get(caseIndex);

                legalCase.setAssignment(Assignment.RANDOM);

                LegalRelationship legalRelationship = legalRelationshipRepository.findById(legalCase.getLegalRelationship().getLegalRelationshipId())
                        .orElseThrow(() -> new AppException(ErrorCode.LEGAL_RELATIONSHIP_NOT_EXISTED));

                LegalCaseType typeOfLegalCase = typeOfLegalCaseRepository.findById(legalRelationship.getLegalCaseType().getTypeOfLegalCaseId())
                        .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_NOT_EXISTED));

                legalCase.setExpiredDate(
                        typeOfLegalCase.getCodeName().equals("HS")
                                ? legalCase.getAcceptanceDate().plusMonths(2)
                                : legalCase.getAcceptanceDate().plusMonths(4)
                );

                legalCase.setAssignmentDate(LocalDateTime.now());
                legalCase.setStatusOfLegalCase(LegalCaseStatus.IN_PROCESS);
                legalCase.setJudge(
                        Judge.builder()
                                .officerId(judge.getOfficerId())
                                .build()
                );

                legalCaseRepository.save(legalCase);
                if (maxCases != -1) {
                    judge.setNumberOfLegalCase(currentCases + 1);
                }

                legalCases.remove(caseIndex);
            }

            judgeIndex = (judgeIndex + 1) % judges.size();

            boolean anyJudgeAvailable = judges.stream()
                    .anyMatch(j -> j.getMaxNumberOfLegalCase() == -1 ||
                            j.getNumberOfLegalCase() < j.getMaxNumberOfLegalCase());

            if (!anyJudgeAvailable) {
                break;
            }
        }
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    @Async
    @Synchronized
    @Transactional
    public void assignAssignment(AssignAssignmentRequest request) {
        if (request == null) {
            throw new AppException(ErrorCode.RANDOM_ASSIGNMENT_FAILED);
        }

        LegalCase legalCase = legalCaseRepository.findById(request.getLegalCaseId())
                .orElseThrow(() -> new AppException(ErrorCode.LEGAL_CASE_NOT_EXISTED));


        Judge judge = judgeRepository.findById(request.getJudgeId())
                .orElseThrow(() -> new AppException(ErrorCode.JUDGE_NOT_EXISTED));

        legalCase.setAssignment(Assignment.ASSIGN);
        legalCase.setAssignmentDate(LocalDateTime.now());

        LegalRelationship legalRelationship = legalRelationshipRepository.findById(legalCase.getLegalRelationship().getLegalRelationshipId())
                .orElseThrow(() -> new AppException(ErrorCode.LEGAL_RELATIONSHIP_NOT_EXISTED));

        LegalCaseType typeOfLegalCase = typeOfLegalCaseRepository.findById(legalRelationship.getLegalCaseType().getTypeOfLegalCaseId())
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_NOT_EXISTED));

        legalCase.setExpiredDate(
                typeOfLegalCase.getCodeName().equals("HS")
                        ? legalCase.getAcceptanceDate().plusMonths(2)
                        : legalCase.getAcceptanceDate().plusMonths(4));
        legalCase.setStatusOfLegalCase(LegalCaseStatus.IN_PROCESS);
        legalCase.setJudge(judge);

        legalCaseRepository.save(legalCase);
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public PageResponse<LegalCaseResponse> getAssignmentList(AssignmentListRequest request, int page, int size, String sortBy) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(sortBy).descending());

        if (request.isMediator()) {
            Page<LegalCaseResponse> resultPage = legalCaseRepository.getAssignmentListHasMediator(pageable)
                    .map(legalCaseMapper::toLegalCaseResponse);

            return PageResponse.<LegalCaseResponse>builder()
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
        } else {
            if (request.getLegalRelationshipGroupId() == null) {
                throw new AppException(ErrorCode.LEGAL_RELATIONSHIP_GROUP_NOT_EXISTED);
            }

            LegalRelationshipGroup legalRelationshipGroup = legalRelationshipGroupRepository.findById(request.getLegalRelationshipGroupId())
                    .orElseThrow(() -> new AppException(ErrorCode.LEGAL_RELATIONSHIP_GROUP_NOT_EXISTED));

            Page<LegalCaseResponse> resultPage = legalCaseRepository.getAssignmentListByLegalRelationshipGroup(
                    legalRelationshipGroup.getLegalRelationshipGroupId(),
                    pageable
            ).map(legalCaseMapper::toLegalCaseResponse);

            return PageResponse.<LegalCaseResponse>builder()
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
    }


    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    @Async
    @Synchronized
    @Transactional
    public void changeBatch(ChangeBatchRequest request) {
        if (request == null
                || request.getLegalCaseIds() == null
                || request.getLegalCaseIds().isEmpty()
                || request.getBatchId() == null
        ) {
            throw new AppException(ErrorCode.BATCH_CHANGE_FAILED);
        }

        Batch batch = batchRepository.findById(request.getBatchId())
                .orElseThrow(() -> new AppException(ErrorCode.BATCH_NOT_EXISTED));

        request.getLegalCaseIds().forEach(legalCaseId -> {
            LegalCase legalCase = legalCaseRepository.findById(legalCaseId)
                    .orElseThrow(() -> new AppException(ErrorCode.LEGAL_CASE_NOT_EXISTED));

            legalCase.setBatch(batch);
            legalCaseRepository.save(legalCase);
        });
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public PageResponse<LegalCaseResponse> getPending(int page, int size, String sortBy) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(sortBy).descending());
        Page<LegalCaseResponse> resultPage = legalCaseRepository.getPending(
                DateUtil.getMilestoneDate(),
                pageable
        ).map(legalCaseMapper::toLegalCaseResponse);

        return PageResponse.<LegalCaseResponse>builder()
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
}