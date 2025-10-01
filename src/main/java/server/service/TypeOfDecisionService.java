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
import server.dto.request.typeOfDecision.TypeOfDecisionRequest;
import server.dto.request.typeOfDecision.TypeOfDecisionSearchRequest;
import server.dto.response.PageResponse;
import server.dto.response.typeOfDecision.TypeOfDecisionResponse;
import server.entity.TypeOfDecision;
import server.entity.TypeOfLegalCase;
import server.exception.AppException;
import server.exception.ErrorCode;
import server.mapper.TypeOfDecisionMapper;
import server.repository.TypeOfDecisionRepository;
import server.repository.TypeOfLegalCaseRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class TypeOfDecisionService {
    TypeOfDecisionRepository typeOfDecisionRepository;
    TypeOfLegalCaseRepository typeOfLegalCaseRepository;

    TypeOfDecisionMapper typeOfDecisionMapper;

    @PreAuthorize("hasAnyRole('ADMIN')")
    public List<TypeOfDecisionResponse> getAll() {
        return typeOfDecisionRepository
                .findAll()
                .stream().map(typeOfDecisionMapper::toTypeOfDecisionResponse)
                .toList();
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void create(TypeOfDecisionRequest request) {
        TypeOfDecision typeOfDecision = TypeOfDecision.builder().build();
        typeOfDecisionMapper.toTypeOfDecision(request, typeOfDecision);
        if (typeOfDecisionRepository.existsByTypeOfDecisionName(typeOfDecision.getTypeOfDecisionName())) {
            throw new AppException(ErrorCode.TYPE_OF_DECISION_NAME_EXISTED);
        }

        TypeOfLegalCase typeOfLegalCase = typeOfLegalCaseRepository.findById(request.getTypeOfLegalCaseId())
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_NOT_EXISTED));

        Integer maxId = typeOfDecisionRepository.getMaxId(typeOfLegalCase.getCodeName()).orElse(0);
        String typeOfLegalCaseId = String.format("%s%02d", typeOfLegalCase.getCodeName(), maxId + 1);
        if (typeOfDecisionRepository.existsById(typeOfLegalCaseId)) {
            throw new AppException(ErrorCode.TYPE_OF_DECISION_EXISTED);
        }

        typeOfLegalCase.setTypeOfLegalCaseId(typeOfLegalCaseId);

        typeOfLegalCaseRepository.save(typeOfLegalCase);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void update(String id, TypeOfDecisionRequest request) {
        TypeOfDecision existing = typeOfDecisionRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_DECISION_NOT_EXISTED));

        typeOfDecisionMapper.toTypeOfDecision(request, existing);
        typeOfDecisionRepository.save(existing);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void delete(String id) {
        TypeOfDecision existing = typeOfDecisionRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_DECISION_NOT_EXISTED));

        typeOfDecisionRepository.delete(existing);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    public PageResponse<TypeOfDecisionResponse> search(TypeOfDecisionSearchRequest request, int page, int size, String sortBy) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(sortBy).ascending());

        Page<TypeOfDecisionResponse> resultPage = typeOfDecisionRepository.search(
                request.getTypeOfDecisionId(),
                request.getTypeOfDecisionName(),
                request.getTypeOfLegalCaseId(),
                request.getCourtIssued(),
                request.isTheEndDecision(),
                pageable
        ).map(typeOfDecisionMapper::toTypeOfDecisionResponse);

        return PageResponse.<TypeOfDecisionResponse>builder()
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
