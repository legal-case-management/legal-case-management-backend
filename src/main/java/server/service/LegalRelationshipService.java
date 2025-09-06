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
import server.dto.request.legalRelationship.LegalRelationshipRequest;
import server.dto.request.legalRelationship.LegalRelationshipSearchRequest;
import server.dto.response.legalRelationship.LegalRelationshipResponse;
import server.entity.LegalRelationship;
import server.entity.TypeOfLegalCase;
import server.exception.AppException;
import server.exception.ErrorCode;
import server.mapper.LegalRelationshipMapper;
import server.repository.LegalRelationshipRepository;
import server.repository.TypeOfLegalCaseRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class LegalRelationshipService {
    LegalRelationshipRepository legalRelationshipRepository;
    TypeOfLegalCaseRepository typeOfLegalCaseRepository;

    LegalRelationshipMapper legalRelationshipMapper;

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public List<LegalRelationshipResponse> getAll() {
        return legalRelationshipRepository
                .getAll()
                .stream().map(legalRelationshipMapper::toLegalRelationshipResponse)
                .toList();
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    @Async
    @Synchronized
    @Transactional
    public void create(LegalRelationshipRequest request) {
        LegalRelationship legalRelationship = LegalRelationship.builder().build();
        legalRelationshipMapper.toLegalRelationship(request, legalRelationship);
        if (legalRelationshipRepository.existsByLegalRelationshipName(legalRelationship.getLegalRelationshipName())) {
            throw new AppException(ErrorCode.LEGAL_RELATIONSHIP_NAME_EXISTED);
        }

        TypeOfLegalCase typeOfLegalCase = typeOfLegalCaseRepository
                .findById(request.getTypeOfLegalCaseId())
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_NOT_EXISTED));

        Integer maxId = legalRelationshipRepository.getMaxId(typeOfLegalCase.getCodeName())
                .orElse(0);

        legalRelationship.setLegalRelationshipId(String.format("%s%03d", typeOfLegalCase.getCodeName(), maxId + 1));
        legalRelationshipRepository.save(legalRelationship);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void update(String id, LegalRelationshipRequest request) {
        LegalRelationship legalRelationshipSaved = legalRelationshipRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.LEGAL_RELATIONSHIP_NOT_EXISTED));

        if (legalRelationshipRepository.existsByLegalRelationshipName(legalRelationshipSaved.getLegalRelationshipName())) {
            throw new AppException(ErrorCode.LEGAL_RELATIONSHIP_NAME_EXISTED);
        }

        legalRelationshipMapper.toLegalRelationship(request, legalRelationshipSaved);
        legalRelationshipRepository.save(legalRelationshipSaved);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void delete(String id) {
        LegalRelationship legalRelationship = legalRelationshipRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.LEGAL_RELATIONSHIP_NOT_EXISTED));
        legalRelationshipRepository.delete(legalRelationship);
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public List<LegalRelationshipResponse> search(LegalRelationshipSearchRequest request) {
        return legalRelationshipRepository.search(
                        request.getLegalRelationshipId(),
                        request.getLegalRelationshipName(),
                        request.getTypeOfLegalCaseId(),
                        request.getLegalRelationshipGroupId()
                )
                .stream()
                .map(legalRelationshipMapper::toLegalRelationshipResponse)
                .toList();
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public List<LegalRelationshipResponse> getLimit(int limit) {
        return legalRelationshipRepository
                .getLimit(PageRequest.of(0, limit))
                .stream()
                .map(legalRelationshipMapper::toLegalRelationshipResponse)
                .toList();
    }
}
