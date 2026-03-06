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
import server.dto.request.decisionType.DecisionTypeRequest;
import server.dto.request.decisionType.DecisionTypeSearchRequest;
import server.dto.response.PageResponse;
import server.dto.response.decisionType.DecisionTypeResponse;
import server.entity.DecisionType;
import server.entity.HandleDecisionType;
import server.entity.LegalCaseType;
import server.entity.enums.LegalCaseStatus;
import server.exception.AppException;
import server.exception.ErrorCode;
import server.mapper.DecisionTypeMapper;
import server.mapper.PageMapper;
import server.repository.DecisionTypeRepository;
import server.repository.HandleDecisionTypeRepository;
import server.repository.LegalCaseTypeRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class DecisionTypeService {
    DecisionTypeRepository decisionTypeRepository;
    LegalCaseTypeRepository legalCaseTypeRepository;
    HandleDecisionTypeRepository handleDecisionTypeRepository;

    DecisionTypeMapper decisionTypeMapper;
    PageMapper pageMapper;


    @PreAuthorize("hasAnyRole('ADMIN')")
    public List<DecisionTypeResponse> getAll() {
        return decisionTypeRepository
                .findAll()
                .stream().map(decisionTypeMapper::toDecisionTypeResponse)
                .toList();
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    public DecisionTypeResponse getById(String id) {
        return decisionTypeRepository.findById(id)
                .map(decisionTypeMapper::toDecisionTypeResponse)
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_DECISION_NOT_EXISTED));
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void create(DecisionTypeRequest request) {
        DecisionType decisionType = DecisionType.builder().build();
        decisionTypeMapper.toDecisionType(request, decisionType);

        if (decisionTypeRepository.existsByDecisionTypeName(decisionType.getDecisionTypeName())) {
            throw new AppException(ErrorCode.TYPE_OF_DECISION_NAME_EXISTED);
        }

        LegalCaseType legalCaseType = legalCaseTypeRepository.findById(request.getLegalCaseTypeId())
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_NOT_EXISTED));

        Integer maxId = decisionTypeRepository.getMaxId(legalCaseType.getCodeName()).orElse(0);
        String decisionTypeId = String.format("%s%02d", legalCaseType.getCodeName(), maxId + 1);

        if (decisionTypeRepository.existsById(decisionTypeId)) {
            throw new AppException(ErrorCode.TYPE_OF_DECISION_EXISTED);
        }

        decisionType.setDecisionTypeId(decisionTypeId);
        decisionType.setLegalCaseType(legalCaseType);

        DecisionType decisionTypeSaved = decisionTypeRepository.save(decisionType);

        for (LegalCaseStatus status : LegalCaseStatus.values()) {
            HandleDecisionType handleDecisionType = HandleDecisionType.builder()
                    .decisionType(decisionTypeSaved)
                    .preStatus(status)
                    .postStatus(status)
                    .active(false)
                    .extensionPeriod(0)
                    .build();
            handleDecisionTypeRepository.save(handleDecisionType);
        }
    }


    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void update(String id, DecisionTypeRequest request) {
        DecisionType existing = decisionTypeRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_DECISION_NOT_EXISTED));

        decisionTypeMapper.toDecisionType(request, existing);

        if(request.getLegalCaseTypeId() != null) {
            LegalCaseType legalCaseType = legalCaseTypeRepository.findById(request.getLegalCaseTypeId())
                    .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_NOT_EXISTED));
            existing.setLegalCaseType(legalCaseType);
        }

        decisionTypeRepository.save(existing);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void delete(String id) {
        DecisionType existing = decisionTypeRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_DECISION_NOT_EXISTED));

        decisionTypeRepository.delete(existing);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    public PageResponse<DecisionTypeResponse> search(DecisionTypeSearchRequest request, int page, int size, String sortBy) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(sortBy).ascending());

        Page<DecisionTypeResponse> resultPage = decisionTypeRepository.search(
                request.getDecisionTypeId(),
                request.getDecisionTypeName(),
                request.getLegalCaseTypeId(),
                request.getCourtIssued(),
                pageable
        ).map(decisionTypeMapper::toDecisionTypeResponse);

        return pageMapper.map(resultPage);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    public List<DecisionTypeResponse> getByLegalCaseType(String legalCaseTypeId) {
        LegalCaseType legalCaseType = legalCaseTypeRepository.findById(legalCaseTypeId)
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_NOT_EXISTED));
        return decisionTypeRepository
                .getByLegalCaseType(legalCaseType)
                .stream().map(decisionTypeMapper::toDecisionTypeResponseBasic)
                .toList();
    }
}
