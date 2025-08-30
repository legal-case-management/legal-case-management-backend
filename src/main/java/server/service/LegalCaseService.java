package server.service;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.Synchronized;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.PageRequest;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import server.dto.request.legalCase.*;
import server.dto.response.judge.JudgeResponse;
import server.dto.response.legalCase.LegalCaseResponse;
import server.entity.Batch;
import server.entity.Judge;
import server.entity.LegalCase;
import server.entity.LegalRelationship;
import server.entity.enums.Assignment;
import server.entity.enums.StatusOfLegalCase;
import server.exception.AppException;
import server.exception.ErrorCode;
import server.mapper.JudgeMapper;
import server.mapper.LegalCaseMapper;
import server.repository.JudgeRepository;
import server.repository.LegalCaseRepository;
import server.repository.LegalRelationshipRepository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class LegalCaseService {
    LegalCaseRepository legalCaseRepository;
    LegalRelationshipRepository legalRelationshipRepository;

    JudgeRepository judgeRepository;

    LegalCaseMapper legalCaseMapper;
    JudgeMapper judgeMapper;

    BatchService batchService;

    @PreAuthorize("hasAnyRole('ADMIN', ' MANAGER')")
    public List<LegalCaseResponse> getAll() {
        return legalCaseRepository
                .findAll()
                .stream().map(legalCaseMapper::toLegalCaseResponse)
                .toList();
    }

    @PreAuthorize("hasAnyRole('ADMIN', ' MANAGER')")
    public List<LegalCaseResponse> getTop50() {
        return legalCaseRepository
                .getTop50(PageRequest.of(0, 50))
                .stream().map(legalCaseMapper::toLegalCaseResponse)
                .toList();
    }

    @PreAuthorize("hasAnyRole('ADMIN', ' MANAGER')")
    public List<LegalCaseResponse> search(LegalCaseSearchRequest request) {
        return legalCaseRepository.search(
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
                        request.getJudgeName(),
                        request.getBatchId(),
                        request.getStorageDate(),
                        PageRequest.of(0, 50)
                )
                .stream()
                .map(legalCaseMapper::toLegalCaseResponse)
                .toList();
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    @Async
    @Synchronized
    @Transactional
    public void create(LegalCaseRequest request) {
        createSingle(request, null);
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    @Async
    @Synchronized
    @Transactional
    public void importFromExcel(LegalCasesRequest request) {
        Batch batch = batchService.create(request.getBatch());

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
                legalRelationship.getTypeOfLegalCase().getCodeName()
        ).orElse(0);

        String legalCaseId = String.format(
                "%04d%s%04d",
                legalCase.getAcceptanceDate().getYear(),
                legalRelationship.getTypeOfLegalCase().getCodeName(),
                legalCaseMaxNumberOfId + 1
        );
        if (legalCaseRepository.existsById(legalCaseId)) {
            throw new AppException(ErrorCode.LEGAL_CASE_EXISTED);
        }

        legalCase.setLegalCaseId(legalCaseId);
        legalCase.setStorageDate(LocalDateTime.now());
        legalCase.setLegalRelationship(legalRelationship);

        if (legalCase.getStatusOfLegalCase() == null)
            legalCase.setStatusOfLegalCase(StatusOfLegalCase.WAITING_FOR_ASSIGNMENT);

        if (request.getJudgeId() != null)
            legalCase.setJudge(
                    Judge.builder()
                            .judgeId(request.getJudgeId())
                            .build()
            );

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
        if (request.getAcceptanceDate() != null
                && !legalCaseSaved.getStatusOfLegalCase().equals(StatusOfLegalCase.WAITING_FOR_ASSIGNMENT)
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
        legalCaseRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.LEGAL_CASE_NOT_EXISTED));
        legalCaseRepository.deleteById(id);
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    @Synchronized
    @Transactional
    public List<LegalCaseResponse> randomAssignment(RandomAssignmentRequest request) {
        if (request == null)
            throw new AppException(ErrorCode.RANDOM_ASSIGNMENT_FAILED);

        // Lấy danh sách thẩm phán đã sắp xếp
        List<JudgeResponse> judges = judgeRepository.getAssignAssignment(LocalDate.now().minusYears(1));
        if (judges.isEmpty())
            throw new AppException(ErrorCode.NO_JUDGES_AVAILABLE);

        // Lấy danh sách vụ án chờ phân công
        List<LegalCase> legalCases = legalCaseRepository.getAssignAssignment(request.getLegalCaseIds());
        if (legalCases.isEmpty())
            throw new AppException(ErrorCode.NO_LEGAL_CASES_FOUND);

        List<LegalCase> legalCasesAssigned = new ArrayList<>();

        Random random = new Random();
        int judgeIndex = 0;
        int initialSize = legalCases.size();

        while (!legalCases.isEmpty()) {
            JudgeResponse judge = judges.get(judgeIndex);
            long currentCases = judge.getNumberOfLegalCases();

            // Phân công nếu thẩm phán còn nhận được vụ án
            if (currentCases < judge.getMaxNumberOfLegalCase()) {
                int caseIndex = random.nextInt(legalCases.size());
                LegalCase legalCase = legalCases.get(caseIndex);

                legalCase.setAssignment(Assignment.ASSIGN);
                legalCase.setAssignmentDate(LocalDateTime.now());
                legalCase.setStatusOfLegalCase(StatusOfLegalCase.IN_PROCESS);
                legalCase.setJudge(
                        Judge.builder()
                                .judgeId(judge.getJudgeId())
                                .build()
                );

                legalCaseRepository.save(legalCase);
                judge.setNumberOfLegalCases(currentCases + 1); // Cập nhật số vụ án
                legalCases.remove(caseIndex);
                legalCasesAssigned.add(legalCase);
            }

            // Chuyển sang thẩm phán tiếp theo
            judgeIndex = (judgeIndex + 1) % judges.size();

            // Nếu duyệt hết một vòng mà không phân công được
            if (!legalCases.isEmpty() && legalCases.size() == initialSize) {
                break;
            }
        }

        return legalCaseRepository
                .getAssignAssigned(legalCasesAssigned.stream().map(LegalCase::getLegalCaseId).collect(Collectors.toList()))
                .stream()
                .map(legalCaseMapper::toLegalCaseResponse)
                .toList();
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
        legalCase.setStatusOfLegalCase(StatusOfLegalCase.IN_PROCESS);
        legalCase.setJudge(judge);

        legalCaseRepository.save(legalCase);
    }
}