package server.service;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.Synchronized;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionSynchronization;
import org.springframework.transaction.support.TransactionSynchronizationManager;
import server.dto.response.judge.JudgeAssignmentInfoResponse;
import server.dto.request.legalCase.*;
import server.dto.response.PageResponse;
import server.dto.response.legalCase.LegalCaseResponse;
import server.entity.*;
import server.entity.enums.Assignment;
import server.entity.enums.LegalCaseStatus;
import server.exception.AppException;
import server.exception.ErrorCode;
import server.mapper.*;
import server.repository.*;
import server.utils.DateUtils;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@Slf4j
public class LegalCaseService {
    LegalCaseRepository legalCaseRepository;
    LegalRelationshipRepository legalRelationshipRepository;
    LegalRelationshipGroupRepository legalRelationshipGroupRepository;
    LegalCaseTypeRepository legalCaseTypeRepository;
    DocumentRepository decisionRepository;
    JudgeRepository judgeRepository;
    BatchRepository batchRepository;
    MediatorRepository mediatorRepository;

    LegalCaseMapper legalCaseMapper;
    PageMapper pageMapper;
    DocumentMapper documentMapper;

    JudgeService judgeService;
    NotificationService notificationService;
    AuthenticationService authenticationService;

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
                request.getMediator(),
                pageable
        ).map(legalCase -> {
            LegalCaseResponse legalCaseResponse = legalCaseMapper.toLegalCaseResponse(legalCase);
            List<Document> documents = decisionRepository.findAllByLegalCase(legalCase, Sort.by("releaseDate").descending());
            legalCaseResponse.setDecisionInfos(
                    documents
                            .stream()
                            .map(documentMapper::toDecisionInfo)
                            .toList()
            );
            return legalCaseResponse;
        });

        return pageMapper.map(resultPage);
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    @Synchronized
    @Transactional
    public void create(LegalCaseRequest request) {
        Account actor = authenticationService.getCurrentAccount();

        Batch batch = batchRepository.findById(request.getBatchId())
                .orElseThrow(() -> new AppException(ErrorCode.BATCH_NOT_EXISTED));

        LegalCase created = createSingle(request, batch);

        // Thông báo nhập án mới (và phân công nếu án mới đã có sẵn thẩm phán).
        safeNotify(() -> notificationService.notifyCaseCreated(created, actor));
    }

    public LegalCaseResponse getById(String id) {
        return legalCaseRepository.findById(id)
                .map(legalCaseMapper::toLegalCaseResponse)
                .orElseThrow(() -> new AppException(ErrorCode.LEGAL_CASE_NOT_EXISTED));
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    @Synchronized
    @Transactional
    public void importFromExcel(LegalCasesRequest request) {
        Account actor = authenticationService.getCurrentAccount();

        Batch batch = batchRepository.findById(request.getBatchId())
                .orElseThrow(() -> new AppException(ErrorCode.BATCH_NOT_EXISTED));

        for (LegalCaseRequest legalCaseRequest : request.getLegalCases()) {
            LegalCase created = createSingle(legalCaseRequest, batch);
            safeNotify(() -> notificationService.notifyCaseCreated(created, actor));
        }
    }

    private LegalCase createSingle(LegalCaseRequest request, Batch batch) {
        LegalCase legalCase = LegalCase.builder().build();
        legalCaseMapper.toLegalCase(request, legalCase);

        LegalRelationship legalRelationship = legalRelationshipRepository.findById(request.getLegalRelationshipId())
                .orElseThrow(() -> new AppException(ErrorCode.LEGAL_RELATIONSHIP_NOT_EXISTED));

        Integer legalCaseMaxNumberOfId = legalCaseRepository.getMaxId(
                String.format("%04d", DateUtils.getCurrentYear(legalCase.getAcceptanceDate())),
                legalRelationship.getLegalCaseType().getCodeName()
        ).orElse(0);

        String legalCaseId = String.format(
                "%04d%s%05d",
                DateUtils.getCurrentYear(legalCase.getAcceptanceDate()),
                legalRelationship.getLegalCaseType().getCodeName(),
                legalCaseMaxNumberOfId + 1
        );

        if (legalCaseRepository.existsById(legalCaseId)) {
            throw new AppException(ErrorCode.LEGAL_CASE_EXISTED);
        }

        legalCase.setLegalCaseId(legalCaseId);
        legalCase.setStorageDate(LocalDateTime.now());
        legalCase.setLegalRelationship(legalRelationship);

        if (legalCase.getLegalCaseStatus() == null){
            if(request.getJudgeId() != null) {
                legalCase.setLegalCaseStatus(LegalCaseStatus.IN_PROCESS);
            } else {
                legalCase.setLegalCaseStatus(LegalCaseStatus.WAITING_FOR_ASSIGNMENT);
            }
        }

        LegalCaseType legalCaseType = legalCaseTypeRepository.findById(legalRelationship.getLegalCaseType().getLegalCaseTypeId())
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_NOT_EXISTED));

        if (request.getJudgeId() != null) {
            Judge existingJudge = judgeRepository.findById(request.getJudgeId())
                    .orElseThrow(() -> new AppException(ErrorCode.JUDGE_NOT_EXISTED));
            legalCase.setJudge(existingJudge);
            legalCase.setAssignment(Assignment.ASSIGN);
            legalCase.setAssignmentDate(LocalDateTime.now());

            legalCase.setExpiredDate(
                    legalCaseType.getCodeName().equals("HS")
                            ? legalCase.getAcceptanceDate().plusMonths(2)
                            : legalCase.getAcceptanceDate().plusMonths(4)
            );
        }

        if (request.getMediatorId() != null) {
            if(legalCaseType.getCodeName().equals("HS"))
                throw new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_CODE_EXISTED);
            Mediator existingMediator = mediatorRepository.findById(request.getMediatorId())
                    .orElseThrow(() -> new AppException(ErrorCode.MEDIATOR_NOT_EXISTED));
            legalCase.setMediator(existingMediator);
        }

        legalCase.setBatch(batch);
        return legalCaseRepository.save(legalCase);
    }


    @PreAuthorize("hasAnyRole('ADMIN')")
    @Synchronized
    @Transactional
    public void update(String id, LegalCaseRequest request) {
        Account actor = authenticationService.getCurrentAccount();

        LegalCase legalCaseSaved = legalCaseRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.LEGAL_CASE_NOT_EXISTED));

        legalCaseMapper.toLegalCase(request, legalCaseSaved);
        if (request.getLegalRelationshipId() != null) {
            LegalRelationship legalRelationship = legalRelationshipRepository.findById(request.getLegalRelationshipId())
                    .orElseThrow(() -> new AppException(ErrorCode.LEGAL_RELATIONSHIP_NOT_EXISTED));
            legalCaseSaved.setLegalRelationship(legalRelationship);
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
                && legalCaseSaved.getDocuments().isEmpty()
        ) {
            LegalCaseType legalCaseType = legalCaseTypeRepository.getByLegalRelationships(legalCaseSaved.getLegalRelationship())
                    .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_NOT_EXISTED));
            LocalDate expiredDate;
            if(legalCaseType.getCodeName().equals("HS")) {
                expiredDate = legalCaseSaved.getAcceptanceDate().plusMonths(2);
            }else {
                expiredDate = legalCaseSaved.getAcceptanceDate().plusMonths(4);
            }
            legalCaseSaved.setExpiredDate(expiredDate);
        }

        legalCaseRepository.save(legalCaseSaved);

        safeNotify(() -> notificationService.notifyCaseUpdated(legalCaseSaved, actor));
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Synchronized
    @Transactional
    public void delete(String id) {
        Account actor = authenticationService.getCurrentAccount();

        LegalCase legalCaseSaved = legalCaseRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.LEGAL_CASE_NOT_EXISTED));

        // Thông báo xóa án (cho người xóa và thẩm phán) TRƯỚC khi xóa khỏi DB,
        // vì sau khi xóa không còn lấy được thông tin án/thẩm phán.
        safeNotify(() -> notificationService.notifyCaseDeleted(legalCaseSaved, actor));

        legalCaseRepository.delete(legalCaseSaved);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Synchronized
    @Transactional
    public void randomAssignment(RandomAssignmentRequest request) {
        if (request == null)
            throw new AppException(ErrorCode.RANDOM_ASSIGNMENT_FAILED);

        List<JudgeAssignmentInfoResponse> judges = judgeService.listAssignment(
                request.getLegalRelationshipGroupId()
        );

        if (judges.isEmpty())
            throw new AppException(ErrorCode.NO_JUDGES_AVAILABLE);

        List<LegalCase> legalCases = getAssignmentList(
                request.getLegalCaseIds(),
                request.getLegalRelationshipGroupId()
        );

        if (legalCases.isEmpty())
            throw new AppException(ErrorCode.NO_LEGAL_CASES_FOUND);

        Random random = new Random();

        // --- PHÂN CÔNG CÂN BẰNG VỚI MIN-HEAP ---
        // Luôn lấy ra thẩm phán có số án ít nhất để phân công
        PriorityQueue<JudgeAssignmentInfoResponse> minHeap = new PriorityQueue<>(
                Comparator.comparingLong(JudgeAssignmentInfoResponse::getNumberByCondition)
        );

        // Đưa thẩm phán vào heap
        for (JudgeAssignmentInfoResponse judge : judges) {
            minHeap.offer(judge);
        }

        if (minHeap.isEmpty())
            throw new AppException(ErrorCode.NO_JUDGES_AVAILABLE);

        while (!legalCases.isEmpty()) {
            // Không còn thẩm phán nào nhận án được → dừng
            if (minHeap.isEmpty())
                throw new AppException(ErrorCode.NO_JUDGES_AVAILABLE_FOR_LEGAL_CASES);

            // Lấy thẩm phán có số án ít nhất
            JudgeAssignmentInfoResponse currentJudge = minHeap.poll();

            // Phân công 1 án ngẫu nhiên
            LegalCase legalCase = legalCases.remove(random.nextInt(legalCases.size()));
            assignLegalCaseToJudge(legalCase, currentJudge);
            currentJudge.setNumberByCondition(currentJudge.getNumberByCondition() + 1);
            currentJudge.setNumberWithType(currentJudge.getNumberWithType() + 1);

            // Đưa lại vào heap nếu chưa đạt giới hạn
            if (currentJudge.getMaxWithType() == null || currentJudge.getNumberWithType() < currentJudge.getMaxWithType()) {
                minHeap.offer(currentJudge);
            }
        }
    }


    private void assignLegalCaseToJudge(LegalCase legalCase, JudgeAssignmentInfoResponse judge) {
        LegalCaseType legalCaseType = legalCaseTypeRepository.getByLegalRelationships(legalCase.getLegalRelationship())
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_NOT_EXISTED));

        legalCase.setAssignment(Assignment.RANDOM);

        legalCase.setExpiredDate(
                legalCaseType.getCodeName().equals("HS")
                        ? legalCase.getAcceptanceDate().plusMonths(2)
                        : legalCase.getAcceptanceDate().plusMonths(4)
        );

        legalCase.setAssignmentDate(LocalDateTime.now());
        legalCase.setLegalCaseStatus(LegalCaseStatus.IN_PROCESS);
        legalCase.setJudge(
                Judge.builder()
                .officerId(judge.getOfficerId())
                .build()
        );

        legalCaseRepository.save(legalCase);

        // Thông báo phân công ngẫu nhiên cho thẩm phán tương ứng (real-time).
        safeNotify(() -> notificationService.notifyCaseAssigned(legalCase));
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Synchronized
    @Transactional
    public void assignAssignment(AssignAssignmentRequest request) {
        if (request == null || request.getLegalCaseId() == null || request.getJudgeId() == null) {
            throw new AppException(ErrorCode.ASSIGN_ASSIGNMENT_FAILED);
        }

        LegalCase legalCase = legalCaseRepository.findById(request.getLegalCaseId())
                .orElseThrow(() -> new AppException(ErrorCode.LEGAL_CASE_NOT_EXISTED));


        Judge judge = judgeRepository.findById(request.getJudgeId())
                .orElseThrow(() -> new AppException(ErrorCode.JUDGE_NOT_EXISTED));

        boolean isMediator = legalCase.getMediator() != null;

        Boolean isAvailable;
        if(isMediator){
            isAvailable = judgeRepository.isAvailableAssignmentWithMediator(
                    DateUtils.getMilestoneStartDate(),
                    DateUtils.getMilestoneEndDate(),
                    judge.getOfficerId()
            );
        }else {
            isAvailable = judgeRepository.isAvailableAssignmentWithoutMediator(
                    DateUtils.getMilestoneStartDate(),
                    DateUtils.getMilestoneEndDate(),
                    legalCase.getLegalRelationship().getLegalRelationshipGroup(),
                    judge.getOfficerId()
            );
        }

        // Query có thể trả null khi GROUP BY/HAVING không sinh dòng -> coi như không khả dụng.
        if (isAvailable == null || !isAvailable) {
            throw new AppException(ErrorCode.JUDGE_NOT_AVAILABLE);
        }


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

        // Thông báo phân công chỉ định cho thẩm phán tương ứng (real-time).
        safeNotify(() -> notificationService.notifyCaseAssigned(legalCase));
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public PageResponse<LegalCaseResponse> getAssignmentList(String legalRelationshipGroupId, int page, int size, String sortBy) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(sortBy).descending());

        boolean isMediator = legalRelationshipGroupId == null;

        if (isMediator) {
            Page<LegalCaseResponse> resultPage = legalCaseRepository.getAssignmentListWithMediator(pageable)
                    .map(legalCaseMapper::toLegalCaseResponse);

            return pageMapper.map(resultPage);
        } else {
            LegalRelationshipGroup legalRelationshipGroup = legalRelationshipGroupRepository.findById(legalRelationshipGroupId)
                    .orElseThrow(() -> new AppException(ErrorCode.LEGAL_RELATIONSHIP_GROUP_NOT_EXISTED));

            Page<LegalCaseResponse> resultPage = legalCaseRepository.getAssignmentListWithoutMediator(
                    legalRelationshipGroup.getLegalRelationshipGroupId(),
                    pageable
            ).map(legalCaseMapper::toLegalCaseResponse);

            return pageMapper.map(resultPage);
        }
    }

    public List<LegalCase> getAssignmentList(List<String> legalCaseIds, String legalRelationshipGroupId) {
        boolean isMediator = legalRelationshipGroupId == null;

        if (isMediator) {
             return legalCaseRepository.getAssignmentListWithMediator(legalCaseIds);
        } else {
            LegalRelationshipGroup legalRelationshipGroup = legalRelationshipGroupRepository.findById(legalRelationshipGroupId)
                    .orElseThrow(() -> new AppException(ErrorCode.LEGAL_RELATIONSHIP_GROUP_NOT_EXISTED));

            return legalCaseRepository.getAssignmentListWithoutMediator(
                    legalCaseIds,
                    legalRelationshipGroup
            );
        }
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    @Transactional
    public void removeAssignment(String legalCaseId) {
        Account actor = authenticationService.getCurrentAccount();

        LegalCase legalCase = legalCaseRepository.findById(legalCaseId)
                .orElseThrow(() -> new AppException(ErrorCode.LEGAL_CASE_NOT_EXISTED));

        if (legalCase.getJudge() == null)
            throw new AppException(ErrorCode.LEGAL_CASE_NOT_ASSIGNED);

        // Lưu lại thẩm phán bị gỡ trước khi set null để còn thông báo cho họ.
        Judge removedJudge = legalCase.getJudge();

        legalCase.setAssignment(null);
        legalCase.setAssignmentDate(null);
        legalCase.setExpiredDate(null);
        legalCase.setLegalCaseStatus(LegalCaseStatus.WAITING_FOR_ASSIGNMENT);
        legalCase.setJudge(null);
        legalCaseRepository.save(legalCase);

        // Thông báo gỡ phân công cho người thực hiện và thẩm phán bị gỡ (real-time).
        safeNotify(() -> notificationService.notifyAssignmentRemoved(legalCase, removedJudge, actor));
    }

    @Scheduled(cron = "0 0 0 * * *", zone = "Asia/Ho_Chi_Minh")
    public void updateCaseStatuses() {
        int waiting = legalCaseRepository.updateWaitingForAssignment();
        int overdue = legalCaseRepository.updateOverdue();
        System.out.println("Updated " + waiting + " cases to WAITING_FOR_ASSIGNMENT and " + overdue + " cases to OVERDUE.");
    }

    /**
     * Gửi thông báo như một side-effect SAU KHI transaction nghiệp vụ commit thành công.
     *
     * Lý do chạy sau commit: thông báo tham chiếu khóa ngoại tới án (legal_case_id).
     * Nếu chạy trong khi transaction nghiệp vụ chưa commit, bản ghi án chưa hiện hữu ở
     * tầng DB nên insert thông báo sẽ vi phạm khóa ngoại. Sau commit, án đã tồn tại,
     * các phương thức notify (chạy transaction mới) sẽ thấy được và tạo thông báo hợp lệ.
     *
     * Nếu tạo/đẩy thông báo lỗi thì chỉ ghi log, KHÔNG ảnh hưởng nghiệp vụ chính
     * (vốn đã commit xong).
     */
    private void safeNotify(Runnable notifyAction) {
        if (TransactionSynchronizationManager.isSynchronizationActive()) {
            TransactionSynchronizationManager.registerSynchronization(
                    new TransactionSynchronization() {
                        @Override
                        public void afterCommit() {
                            runNotify(notifyAction);
                        }
                    }
            );
        } else {
            // Không có transaction đang hoạt động -> chạy trực tiếp.
            runNotify(notifyAction);
        }
    }

    private void runNotify(Runnable notifyAction) {
        try {
            notifyAction.run();
        } catch (Exception e) {
            log.error("Gửi thông báo thất bại", e);
        }
    }
}