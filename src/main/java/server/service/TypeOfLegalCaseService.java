package server.service;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import server.dto.request.TypeOfLegalCaseRequest;
import server.dto.response.LegalCaseResponse;
import server.dto.response.TypeOfLegalCaseResponse;
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
    @Transactional
    public void create(TypeOfLegalCaseRequest request){
        TypeOfLegalCase typeOfLegalCase = TypeOfLegalCase.builder().build();
        typeOfLegalCaseMapper.toTypeOfLegalCase(request, typeOfLegalCase);
        if (typeOfLegalCaseRepository.existsByCodeName(typeOfLegalCase.getCodeName())) {
            throw new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_CODE_EXISTED);
        }

        if (typeOfLegalCaseRepository.existsByTypeOfLegalCaseName(typeOfLegalCase.getTypeOfLegalCaseName())) {
            throw new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_NAME_EXISTED);
        }

        typeOfLegalCaseRepository.save(typeOfLegalCase);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Transactional
    public void update(String id, TypeOfLegalCaseRequest request) {
        TypeOfLegalCase existing = typeOfLegalCaseRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_NOT_EXISTED));

        // Kiểm tra trùng mã codeName nếu có thay đổi
        if (!existing.getCodeName().equals(request.getCodeName()) &&
                typeOfLegalCaseRepository.existsByCodeName(request.getCodeName())) {
            throw new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_CODE_EXISTED);
        }

        // Kiểm tra trùng tên nếu có thay đổi
        if (!existing.getTypeOfLegalCaseName().equals(request.getTypeOfLegalCaseName()) &&
                typeOfLegalCaseRepository.existsByTypeOfLegalCaseName(request.getTypeOfLegalCaseName())) {
            throw new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_NAME_EXISTED);
        }

        typeOfLegalCaseMapper.toTypeOfLegalCase(request, existing);
        typeOfLegalCaseRepository.save(existing);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Transactional
    public void delete(String id) {
        TypeOfLegalCase existing = typeOfLegalCaseRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_NOT_EXISTED));

        typeOfLegalCaseRepository.delete(existing);
    }

}
