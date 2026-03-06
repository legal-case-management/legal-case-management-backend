package server.service;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.Synchronized;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.Sort;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import server.dto.request.decision.DecisionRequest;
import server.dto.response.decision.DecisionResponse;
import server.entity.Decision;
import server.entity.HandleDecisionType;
import server.entity.LegalCase;
import server.entity.DecisionType;
import server.entity.enums.LegalCaseStatus;
import server.exception.AppException;
import server.exception.ErrorCode;
import server.mapper.DecisionMapper;
import server.repository.DecisionRepository;
import server.repository.LegalCaseRepository;
import server.repository.DecisionTypeRepository;

import java.time.LocalDate;
import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class DecisionService {
    DecisionRepository decisionRepository;
    DecisionTypeRepository decisionTypeRepository;
    LegalCaseRepository legalCaseRepository;

    DecisionMapper decisionMapper;


    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void create(DecisionRequest request) {
        Decision decision = Decision.builder().build();
        decisionMapper.toDecision(request, decision);

        DecisionType typeOfDecision = decisionTypeRepository.findById(request.getDecisionTypeId())
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_DECISION_NOT_EXISTED));

        LegalCase legalCase = legalCaseRepository.findById(request.getLegalCaseId())
                .orElseThrow(() -> new AppException(ErrorCode.LEGAL_CASE_NOT_EXISTED));

        if (!typeOfDecision.getHandleTypeOfDecisions().isEmpty()) {
            for (HandleDecisionType handle : typeOfDecision.getHandleTypeOfDecisions()) {

                if (handle.getPreStatus().equals(legalCase.getLegalCaseStatus())) {
                    if (!handle.isActive())
                        throw new AppException(ErrorCode.HANDLE_DECISION_TYPE_BLOCKED);

                    legalCase.setLegalCaseStatus(handle.getPostStatus());
                    if (handle.getExtensionPeriod() > 0) {
                        legalCase.setExpiredDate(decision.getReleaseDate().plusMonths(handle.getExtensionPeriod()));
                    } else if (handle.getPostStatus().equals(LegalCaseStatus.TEMPORARY_SUSPENSION)) {
                        legalCase.setExpiredDate(null);
                    }

                    return;
                }
            }

            throw new AppException(ErrorCode.CAN_NOT_HANDLE_TYPE_OF_DECISION);
        }

        Integer maxId = decisionRepository.getMaxId(legalCase.getLegalCaseId()).orElse(0);
        String decisionId = String.format("%sQD%02d", legalCase.getLegalCaseId(), maxId + 1);
        if (decisionRepository.existsById(decisionId))
            throw new AppException(ErrorCode.DECISION_EXISTED);

        decision.setDecisionId(decisionId);
        decision.setDecisionType(typeOfDecision);
        decision.setLegalCase(legalCase);
        decision.setAddedDate(LocalDate.now());

        decisionRepository.save(decision);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void update(String id, DecisionRequest request) {
        Decision decision = decisionRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.DECISION_NOT_EXISTED));
        decisionMapper.toDecision(request, decision);
        decisionRepository.save(decision);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void delete(String id) {
        Decision decision = decisionRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.DECISION_NOT_EXISTED));
        decisionRepository.delete(decision);
    }


    public List<DecisionResponse> getByLegalCase(String legalCaseId) {
        LegalCase legalCase = legalCaseRepository.findById(legalCaseId)
                .orElseThrow(() -> new AppException(ErrorCode.LEGAL_CASE_NOT_EXISTED));
        return decisionRepository
                .findAllByLegalCase(legalCase, Sort.by("releaseDate").descending())
                .stream().map(decisionMapper::toDecisionResponse)
                .toList();
    }
}
