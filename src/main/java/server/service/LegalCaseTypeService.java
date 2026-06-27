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
import server.dto.request.legalCaseType.LegalCaseTypeRequest;
import server.dto.request.legalCaseType.LegalCaseTypeSearchRequest;
import server.dto.response.PageResponse;
import server.dto.response.legalCaseType.LegalCaseTypeResponse;
import server.entity.LegalCaseType;
import server.exception.AppException;
import server.exception.ErrorCode;
import server.mapper.LegalCaseTypeMapper;
import server.mapper.PageMapper;
import server.repository.LegalCaseTypeRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class LegalCaseTypeService {
    LegalCaseTypeRepository legalCaseTypeRepository;

    LegalCaseTypeMapper legalCaseTypeMapper;
    PageMapper pageMapper;

    @PreAuthorize("hasAnyRole('ADMIN')")
    public List<LegalCaseTypeResponse> getAll() {
        return legalCaseTypeRepository
                .findAll()
                .stream().map(legalCaseTypeMapper::toLegalCaseTypeResponse)
                .toList();
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void create(LegalCaseTypeRequest request) {
        LegalCaseType legalCaseType = LegalCaseType.builder().build();
        legalCaseTypeMapper.toLegalCaseType(request, legalCaseType);
        if (legalCaseTypeRepository.existsByCodeName(legalCaseType.getCodeName())) {
            throw new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_CODE_EXISTED);
        }

        if (legalCaseTypeRepository.existsByLegalCaseTypeName(legalCaseType.getLegalCaseTypeName())) {
            throw new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_NAME_EXISTED);
        }

        Integer maxId = legalCaseTypeRepository.getMaxId().orElse(0);
        String typeOfLegalCaseId =  String.format("%s%02d", "L", maxId + 1);
        if (legalCaseTypeRepository.existsById(typeOfLegalCaseId)) {
            throw new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_EXISTED);
        }

        legalCaseType.setLegalCaseTypeId(typeOfLegalCaseId);
        legalCaseTypeRepository.save(legalCaseType);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void update(String id, LegalCaseTypeRequest request) {
        LegalCaseType existing = legalCaseTypeRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_NOT_EXISTED));

        if (!existing.getCodeName().equals(request.getCodeName()) &&
                legalCaseTypeRepository.existsByCodeName(request.getCodeName())) {
            throw new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_CODE_EXISTED);
        }

        if (!existing.getLegalCaseTypeName().equals(request.getLegalCaseTypeName()) &&
                legalCaseTypeRepository.existsByLegalCaseTypeName(request.getLegalCaseTypeName())) {
            throw new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_NAME_EXISTED);
        }

        legalCaseTypeMapper.toLegalCaseType(request, existing);
        legalCaseTypeRepository.save(existing);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void delete(String id) {
        LegalCaseType existing = legalCaseTypeRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_NOT_EXISTED));

        legalCaseTypeRepository.delete(existing);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    public PageResponse<LegalCaseTypeResponse> search(LegalCaseTypeSearchRequest request, int page, int size, String sortBy) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(sortBy).ascending());

        Page<LegalCaseTypeResponse> resultPage = legalCaseTypeRepository.search(
                request.getLegalCaseTypeId(),
                request.getLegalCaseTypeName(),
                request.getCodeName(),
                pageable
        ).map(legalCaseTypeMapper::toLegalCaseTypeResponse);

        return pageMapper.map(resultPage);
    }
}
