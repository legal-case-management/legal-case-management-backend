package server.service;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import server.dto.request.LegalCaseRequest;
import server.dto.request.LegalCaseSearchRequest;
import server.dto.response.LegalCaseResponse;
import server.entity.Judge;
import server.entity.LegalCase;
import server.exception.AppException;
import server.exception.ErrorCode;
import server.mapper.LegalCaseMapper;
import server.repository.LegalCaseRepository;

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
    public List<LegalCaseResponse> search(LegalCaseSearchRequest request) {
        return legalCaseRepository.searchLegalCases(
                request.getAcceptanceNumber(),
                request.getStartAcceptanceDate(),
                request.getEndAcceptanceDate(),
                request.getPlaintiff(),
                request.getDefendant(),
                request.getTypeOfLegalCase(),
                request.getJudgeName()
        )
                .stream()
                .map(legalCaseMapper::toLegalCaseResponse)
                .toList();
    }

    @PreAuthorize("hasAnyRole('ADMIN', ' MANAGER')")
    public void create(LegalCaseRequest request) {
        LegalCase legalCase = LegalCase.builder().build();
        legalCaseMapper.toLegalCase(request, legalCase);
        if (request.getJudgeId() != null)
            legalCase.setJudge(
                    Judge.builder()
                            .judgeId(request.getJudgeId())
                            .build()
            );

        legalCaseRepository.save(legalCase);
    }

    @PreAuthorize("hasAnyRole('ADMIN', ' MANAGER')")
    @Async
    @Transactional
    public void update(LegalCaseRequest request) {
        legalCaseRepository.findById(request.getLegalCaseId())
                .orElseThrow(() -> new AppException(ErrorCode.LEGAL_CASE_NOT_EXISTED));

        LegalCase legalCase = LegalCase.builder().build();
        legalCaseMapper.toLegalCase(request, legalCase);

        legalCaseRepository.save(legalCase);
    }

    @PreAuthorize("hasAnyRole('ADMIN', ' MANAGER')")
    @Async
    @Transactional
    public void delete(LegalCaseRequest request) {
        legalCaseRepository.findById(request.getLegalCaseId())
                .orElseThrow(() -> new AppException(ErrorCode.LEGAL_CASE_NOT_EXISTED));

        legalCaseRepository.deleteById(request.getLegalCaseId());
    }
}
