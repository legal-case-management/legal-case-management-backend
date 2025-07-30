package server.service;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.PageRequest;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import server.dto.request.LegalCaseRequest;
import server.dto.request.LegalCaseSearchRequest;
import server.dto.response.LegalCaseResponse;
import server.entity.Judge;
import server.entity.LegalCase;
import server.entity.enums.StatusOfLegalCase;
import server.exception.AppException;
import server.exception.ErrorCode;
import server.mapper.LegalCaseMapper;
import server.repository.LegalCaseRepository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class LegalCaseService {
    LegalCaseRepository legalCaseRepository;

    LegalCaseMapper legalCaseMapper;

    @PreAuthorize("hasAnyRole('ADMIN', ' MANAGER')")
    public List<LegalCaseResponse> getAll() {
        return legalCaseRepository
                .findAll()
                .stream().map(legalCaseMapper::toLegalCaseResponse)
                .toList();
    }

    @PreAuthorize("hasAnyRole('ADMIN', ' MANAGER')")
    public List<LegalCaseResponse> getLatest50LegalCases() {
        return legalCaseRepository
                .getLatest50LegalCases(PageRequest.of(0, 50))
                .stream().map(legalCaseMapper::toLegalCaseResponse)
                .toList();
    }

    @PreAuthorize("hasAnyRole('ADMIN', ' MANAGER')")
    public List<LegalCaseResponse> search(LegalCaseSearchRequest request) {
        return legalCaseRepository.searchLegalCases(
                request.getAcceptanceNumber(),
                request.getStartAcceptanceDate(),
                request.getEndAcceptanceDate(),
                request.getPlaintiff(),
                request.getDefendant(),
                request.getLegalRelationship(),
                request.getTypeOfLegalCase(),
                request.getJudgeName()
        )
                .stream()
                .map(legalCaseMapper::toLegalCaseResponse)
                .toList();
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    @Async
    @Transactional
    public void create(LegalCaseRequest request) {
        LegalCase legalCase = LegalCase.builder().build();
        legalCaseMapper.toLegalCase(request, legalCase);

        Integer legalCaseMaxNumberOfId = legalCaseRepository.getMaxAcceptanceNumber(String.format("%04d", legalCase.getAcceptanceDate().getYear()), legalCase.getTypeOfLegalCase().getSimpleName())
                .orElse(0);

        System.out.println(legalCaseMaxNumberOfId);

        String legalCaseId = String.format("%04d%s%04d", legalCase.getAcceptanceDate().getYear(), legalCase.getTypeOfLegalCase().getSimpleName(), legalCaseMaxNumberOfId + 1);
        System.out.println(legalCaseId);
        legalCase.setLegalCaseId(legalCaseId);

        if (legalCaseRepository.existsById(legalCaseId)) {
            throw new AppException(ErrorCode.LEGAL_CASE_EXISTED);
        }

        if (legalCase.getStatusOfLegalCase() == null)
            legalCase.setStatusOfLegalCase(StatusOfLegalCase.WAITING_FOR_ASSIGNMENT);

        if(legalCase.getStatusOfLegalCase() == null)
            legalCase.setStatusOfLegalCase(StatusOfLegalCase.WAITING_FOR_ASSIGNMENT);
        if (request.getJudgeId() != null)
            legalCase.setJudge(
                    Judge.builder()
                            .judgeId(request.getJudgeId())
                            .build()
            );


        legalCaseRepository.save(legalCase);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Transactional
    public void update(LegalCaseRequest request) {
        LegalCase legalCaseSaved = legalCaseRepository.findById(request.getLegalCaseId())
                .orElseThrow(() -> new AppException(ErrorCode.LEGAL_CASE_NOT_EXISTED));

        legalCaseMapper.toLegalCase(request, legalCaseSaved);
        if(request.getAcceptanceDate() != null
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
    @Transactional
    public void delete(LegalCaseRequest request) {
        legalCaseRepository.findById(request.getLegalCaseId())
                .orElseThrow(() -> new AppException(ErrorCode.LEGAL_CASE_NOT_EXISTED));

        legalCaseRepository.deleteById(request.getLegalCaseId());
    }
}