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
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import server.dto.other.judge.JudgeAssignmentInfo;
import server.dto.request.legalCase.*;
import server.dto.response.PageResponse;
import server.dto.response.legalCase.LegalCaseResponse;
import server.entity.*;
import server.entity.enums.Assignment;
import server.entity.enums.LegalCaseStatus;
import server.exception.AppException;
import server.exception.ErrorCode;
import server.mapper.JudgeMapper;
import server.mapper.LegalCaseMapper;
import server.mapper.PageMapper;
import server.repository.*;
import server.utils.JudicialDate;

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
    LegalCaseTypeRepository legalCaseTypeRepository;

    JudgeRepository judgeRepository;
    BatchRepository batchRepository;
    MediatorRepository mediatorRepository;

    LegalCaseMapper legalCaseMapper;
    PageMapper pageMapper;
    JudgeMapper judgeMapper;

    JudgeService judgeService;


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
                request.getLegalRelationshipId(),
                request.getLegalCaseTypeId(),
                request.getLegalRelationshipGroupId(),
                request.getLitigantName(),
                request.getLitigantYearOfBirth(),
                request.getLitigantAddress(),
                request.getLegalCaseStatus(),
                request.getJudgeId(),
                request.getBatchId(),
                request.getStartStorageDate(),
                request.getEndStorageDate(),
                pageable
        ).map(legalCaseMapper::toLegalCaseResponse);

        return pageMapper.map(resultPage);
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
                String.format("%04d", JudicialDate.getCurrentYear(legalCase.getAcceptanceDate())),
                legalRelationship.getLegalCaseType().getCodeName()
        ).orElse(0);

        String legalCaseId = String.format(
                "%04d%s%05d",
                JudicialDate.getCurrentYear(legalCase.getAcceptanceDate()),
                legalRelationship.getLegalCaseType().getCodeName(),
                legalCaseMaxNumberOfId + 1
        );
        if (legalCaseRepository.existsById(legalCaseId)) {
            throw new AppException(ErrorCode.LEGAL_CASE_EXISTED);
        }

        legalCase.setLegalCaseId(legalCaseId);
        legalCase.setStorageDate(LocalDateTime.now());
        legalCase.setLegalRelationship(legalRelationship);

        if (legalCase.getLegalCaseStatus() == null)
            legalCase.setLegalCaseStatus(LegalCaseStatus.WAITING_FOR_ASSIGNMENT);

        if (request.getJudgeId() != null) {
            Judge existingJudge = judgeRepository.findById(request.getJudgeId())
                    .orElseThrow(() -> new AppException(ErrorCode.JUDGE_NOT_EXISTED));
            legalCase.setJudge(existingJudge);
            legalCase.setAssignment(Assignment.ASSIGN);
            legalCase.setAssignmentDate(LocalDateTime.now());

            LegalCaseType legalCaseType = legalCaseTypeRepository.findById(legalRelationship.getLegalCaseType().getLegalCaseTypeId())
                    .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_NOT_EXISTED));

            legalCase.setExpiredDate(
                    legalCaseType.getCodeName().equals("HS")
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
                && !legalCaseSaved.getLegalCaseStatus().equals(LegalCaseStatus.WAITING_FOR_ASSIGNMENT)
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
        if (request == null)
            throw new AppException(ErrorCode.RANDOM_ASSIGNMENT_FAILED);

        LegalRelationshipGroup legalRelationshipGroup = null;
        if (request.getLegalRelationshipGroupId() != null) {
            legalRelationshipGroup = legalRelationshipGroupRepository.findById(request.getLegalRelationshipGroupId())
                    .orElseThrow(() -> new AppException(ErrorCode.LEGAL_RELATIONSHIP_GROUP_NOT_EXISTED));

            if (legalRelationshipGroup.getLegalRelationshipGroupId().equals("N01"))
                throw new AppException(ErrorCode.RANDOM_ASSIGNMENT_NOT_ALLOWED);
        }


        // Lấy danh sách thẩm phán
        List<JudgeAssignmentInfo> judges = new ArrayList<>(
                judgeRepository.getAssignAssignmentRaw(
                                JudicialDate.getMilestoneDateTime(),
                                legalRelationshipGroup
                        ).stream()
                        .map(judgeMapper::toJudgeAssignmentInfo)
                        .peek(judge -> {
                            Long numberOfLandCases = judgeRepository.getNumberOfLandCasesByJudge(
                                    judge.getOfficerId(),
                                    JudicialDate.getMilestoneDateTime(),
                                    JudicialDate.getMilestoneDate()
                            );
                            judge.setNumberOfLegalCaseGroupLand(numberOfLandCases != null ? numberOfLandCases : 0);
                        })
                        .toList()
        );


        if (judges.isEmpty())
            throw new AppException(ErrorCode.NO_JUDGES_AVAILABLE);

        // Lấy danh sách vụ án cần phân công
        List<LegalCase> legalCases = legalCaseRepository.getAssignAssignment(
                request.getLegalCaseIds(),
                legalRelationshipGroup
        );

        if (legalCases.isEmpty())
            throw new AppException(ErrorCode.NO_LEGAL_CASES_FOUND);

        boolean isGroupLand = legalRelationshipGroup != null
                && legalRelationshipGroup.getLegalRelationshipGroupId().equals("N04");

        Random random = new Random();

        // --- PHÂN CÔNG ÁN ---
        while (!legalCases.isEmpty()) {

            // Nếu là nhóm đất (N04): phân bổ công bằng theo numberOfLegalCaseGroupLand
            if (isGroupLand) {
                // Sắp xếp danh sách thẩm phán theo số án đất hiện tại (tăng dần)
                judges.sort(Comparator.comparingLong(JudgeAssignmentInfo::getNumberOfLegalCaseGroupLand));

                // Lấy thẩm phán có số án đất ít nhất
                JudgeAssignmentInfo judge = judges.getFirst();

                LegalCase legalCase = legalCases.remove(random.nextInt(legalCases.size()));
                assignLegalCaseToJudge(legalCase, judge, legalRelationshipGroup);

                // Cập nhật lại thống kê cho thẩm phán
                judge.setNumberOfLegalCaseGroupLand(judge.getNumberOfLegalCaseGroupLand() + 1);

            } else {
                // luôn sắp xếp lại theo tổng án hiện tại (đảm bảo người ít án nhất lên trước)
                judges.sort(Comparator.comparingLong(JudgeAssignmentInfo::getNumberOfLegalCase));

                // lấy thẩm phán ít án nhất
                JudgeAssignmentInfo judge = judges.getFirst();

                Long maxCases = judge.getMaxNumberOfLegalCase();
                if (maxCases != -1 && judge.getNumberOfLegalCase() >= maxCases)
                    break;

                // lấy vụ án bất kỳ (hoặc theo thứ tự)
                LegalCase legalCase = legalCases.removeFirst();

                assignLegalCaseToJudge(legalCase, judge, legalRelationshipGroup);
                judge.setNumberOfLegalCase(judge.getNumberOfLegalCase() + 1);
            }
        }
    }

    private void assignLegalCaseToJudge(LegalCase legalCase, JudgeAssignmentInfo judge, LegalRelationshipGroup group) {
        legalCase.setAssignment(Assignment.RANDOM);

        LegalCaseType legalCaseType = legalCaseTypeRepository.getByLegalRelationships(legalCase.getLegalRelationship())
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_NOT_EXISTED));

        legalCase.setExpiredDate(
                legalCaseType.getCodeName().equals("HS")
                        ? legalCase.getAcceptanceDate().plusMonths(2)
                        : legalCase.getAcceptanceDate().plusMonths(4)
        );

        legalCase.setAssignmentDate(LocalDateTime.now());
        legalCase.setLegalCaseStatus(LegalCaseStatus.IN_PROCESS);
        legalCase.setJudge(Judge.builder()
                .officerId(judge.getOfficerId())
                .build()
        );

        legalCaseRepository.save(legalCase);
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

        LegalCaseType legalCaseType = legalCaseTypeRepository.getByLegalRelationships(legalCase.getLegalRelationship())
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_NOT_EXISTED));

        legalCase.setExpiredDate(
                legalCaseType.getCodeName().equals("HS")
                        ? legalCase.getAcceptanceDate().plusMonths(2)
                        : legalCase.getAcceptanceDate().plusMonths(4));
        legalCase.setLegalCaseStatus(LegalCaseStatus.IN_PROCESS);
        legalCase.setJudge(judge);

        legalCaseRepository.save(legalCase);
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public PageResponse<LegalCaseResponse> getAssignmentList(AssignmentListRequest request, int page, int size, String sortBy) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(sortBy).descending());

        if (request.isMediator()) {
            Page<LegalCaseResponse> resultPage = legalCaseRepository.getAssignmentListHasMediator(pageable)
                    .map(legalCaseMapper::toLegalCaseResponse);

            return pageMapper.map(resultPage);
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

            return pageMapper.map(resultPage);
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
                JudicialDate.getMilestoneDate(),
                pageable
        ).map(legalCaseMapper::toLegalCaseResponse);

        return pageMapper.map(resultPage);
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public void removeAssignment(String legalCaseId) {
        LegalCase legalCase = legalCaseRepository.findById(legalCaseId)
                .orElseThrow(() -> new AppException(ErrorCode.LEGAL_CASE_NOT_EXISTED));

        if(legalCase.getJudge() == null)
            throw new AppException(ErrorCode.LEGAL_CASE_NOT_ASSIGNED);

        legalCase.setAssignment(null);
        legalCase.setAssignmentDate(null);
        legalCase.setExpiredDate(null);
        legalCase.setLegalCaseStatus(LegalCaseStatus.WAITING_FOR_ASSIGNMENT);
        legalCase.setJudge(null);
        legalCaseRepository.save(legalCase);
    }

    @Scheduled(cron = "0 0 0 * * *", zone = "Asia/Ho_Chi_Minh")
    public void updateCaseStatuses() {
        int waiting = legalCaseRepository.updateWaitingForAssignment();
        int overdue = legalCaseRepository.updateOverdue();
        System.out.println("Cập nhật trạng thái vụ án lúc 0h00: "
                + waiting + " WAITING_FOR_ASSIGNMENT, "
                + overdue + " OVERDUE");
    }
}