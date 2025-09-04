package server.service;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.Synchronized;
import lombok.experimental.FieldDefaults;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import server.dto.request.decision.DecisionRequest;
import server.dto.response.decision.DecisionResponse;
import server.entity.Decision;
import server.entity.LegalCase;
import server.entity.TypeOfDecision;
import server.exception.AppException;
import server.exception.ErrorCode;
import server.mapper.DecisionMapper;
import server.repository.DecisionRepository;
import server.repository.LegalCaseRepository;
import server.repository.TypeOfDecisionRepository;

import java.time.LocalDate;
import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class DecisionService {
    DecisionRepository decisionRepository;
    TypeOfDecisionRepository typeOfDecisionRepository;
    LegalCaseRepository legalCaseRepository;

    DecisionMapper decisionMapper;

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void create(DecisionRequest request) {
        Decision decision = Decision.builder().build();
        decisionMapper.toDecision(request, decision);

        TypeOfDecision typeOfDecision = typeOfDecisionRepository.findById(request.getTypeOfDecisionId())
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_DECISION_NOT_EXISTED));

        LegalCase legalCase = legalCaseRepository.findById(request.getLegalCaseId())
                        .orElseThrow(() -> new AppException(ErrorCode.LEGAL_CASE_NOT_EXISTED));


        decision.setTypeOfDecision(typeOfDecision);
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

    @PreAuthorize("hasAnyRole('ADMIN')")
    public List<DecisionResponse> getDecisionByLegalCase(DecisionRequest request) {
        LegalCase legalCase = legalCaseRepository.findById(request.getLegalCaseId())
                .orElseThrow(() -> new AppException(ErrorCode.LEGAL_CASE_NOT_EXISTED));
        return decisionRepository
                .findDecisionByLegalCase(legalCase)
                .stream().map(decisionMapper::toDecisionResponse)
                .toList();
    }
}
