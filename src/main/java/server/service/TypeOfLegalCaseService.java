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
import server.dto.request.typeOfLegalCase.TypeOfLegalCaseRequest;
import server.dto.request.typeOfLegalCase.TypeOfLegalCaseSearchRequest;
import server.dto.response.typeOfLegalCase.TypeOfLegalCaseResponse;
import server.entity.TypeOfLegalCase;
import server.exception.AppException;
import server.exception.ErrorCode;
import server.mapper.TypeOfLegalCaseMapper;
import server.repository.TypeOfLegalCaseRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class TypeOfLegalCaseService {
    TypeOfLegalCaseRepository typeOfLegalCaseRepository;
    TypeOfLegalCaseMapper typeOfLegalCaseMapper;

    @PreAuthorize("hasAnyRole('ADMIN')")
    public List<TypeOfLegalCaseResponse> getAll() {
        return typeOfLegalCaseRepository
                .findAll()
                .stream().map(typeOfLegalCaseMapper::toTypeOfLegalCaseResponse)
                .toList();
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void create(TypeOfLegalCaseRequest request) {
        TypeOfLegalCase typeOfLegalCase = TypeOfLegalCase.builder().build();
        typeOfLegalCaseMapper.toTypeOfLegalCase(request, typeOfLegalCase);
        if (typeOfLegalCaseRepository.existsByCodeName(typeOfLegalCase.getCodeName())) {
            throw new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_CODE_EXISTED);
        }

        if (typeOfLegalCaseRepository.existsByTypeOfLegalCaseName(typeOfLegalCase.getTypeOfLegalCaseName())) {
            throw new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_NAME_EXISTED);
        }

        Integer maxId = typeOfLegalCaseRepository.getMaxId().orElse(0);
        String typeOfLegalCaseId =  String.format("%s%02d", "L", maxId + 1);
        if (typeOfLegalCaseRepository.existsById(typeOfLegalCaseId)) {
            throw new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_EXISTED);
        }

        typeOfLegalCase.setTypeOfLegalCaseId(typeOfLegalCaseId);
        typeOfLegalCaseRepository.save(typeOfLegalCase);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void update(String id, TypeOfLegalCaseRequest request) {
        TypeOfLegalCase existing = typeOfLegalCaseRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_NOT_EXISTED));

        if (!existing.getCodeName().equals(request.getCodeName()) &&
                typeOfLegalCaseRepository.existsByCodeName(request.getCodeName())) {
            throw new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_CODE_EXISTED);
        }

        if (!existing.getTypeOfLegalCaseName().equals(request.getTypeOfLegalCaseName()) &&
                typeOfLegalCaseRepository.existsByTypeOfLegalCaseName(request.getTypeOfLegalCaseName())) {
            throw new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_NAME_EXISTED);
        }

        typeOfLegalCaseMapper.toTypeOfLegalCase(request, existing);
        typeOfLegalCaseRepository.save(existing);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void delete(String id) {
        TypeOfLegalCase existing = typeOfLegalCaseRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_NOT_EXISTED));

        typeOfLegalCaseRepository.delete(existing);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    public List<TypeOfLegalCaseResponse> search(TypeOfLegalCaseSearchRequest request) {
        return typeOfLegalCaseRepository.search(
                        request.getTypeOfLegalCaseId(),
                        request.getCodeName(),
                        request.getTypeOfLegalCaseName()
                ).stream()
                .map(typeOfLegalCaseMapper::toTypeOfLegalCaseResponse)
                .toList();
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public List<TypeOfLegalCaseResponse> getLimit(int limit) {
        return typeOfLegalCaseRepository
                .getLimit(PageRequest.of(0, limit))
                .stream().map(typeOfLegalCaseMapper::toTypeOfLegalCaseResponse)
                .toList();
    }
}
