package com.qlatakv9dt.service;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.Synchronized;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.qlatakv9dt.dto.request.legalRelationship.LegalRelationshipRequest;
import com.qlatakv9dt.dto.request.legalRelationship.LegalRelationshipSearchRequest;
import com.qlatakv9dt.dto.response.PageResponse;
import com.qlatakv9dt.dto.response.legalRelationship.LegalRelationshipResponse;
import com.qlatakv9dt.entity.LegalRelationship;
import com.qlatakv9dt.entity.LegalRelationshipGroup;
import com.qlatakv9dt.entity.LegalCaseType;
import com.qlatakv9dt.exception.AppException;
import com.qlatakv9dt.exception.ErrorCode;
import com.qlatakv9dt.mapper.LegalRelationshipMapper;
import com.qlatakv9dt.mapper.PageMapper;
import com.qlatakv9dt.repository.LegalRelationshipGroupRepository;
import com.qlatakv9dt.repository.LegalRelationshipRepository;
import com.qlatakv9dt.repository.LegalCaseTypeRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class LegalRelationshipService {
    LegalRelationshipRepository legalRelationshipRepository;
    LegalCaseTypeRepository legalCaseTypeRepository;
    LegalRelationshipGroupRepository legalRelationshipGroupRepository;

    LegalRelationshipMapper legalRelationshipMapper;
    PageMapper pageMapper;


    public List<LegalRelationshipResponse> getAll() {
        return legalRelationshipRepository
                .getAll()
                .stream().map(legalRelationshipMapper::toLegalRelationshipResponse)
                .toList();
    }

    @PreAuthorize("hasAuthority('CREATE_LEGAL_RELATIONSHIP')")
    @Synchronized
    @Transactional
    public void create(LegalRelationshipRequest request) {
        LegalRelationship legalRelationship = LegalRelationship.builder().build();
        legalRelationshipMapper.toLegalRelationship(request, legalRelationship);
        if (legalRelationshipRepository.existsByLegalRelationshipName(legalRelationship.getLegalRelationshipName())) {
            throw new AppException(ErrorCode.LEGAL_RELATIONSHIP_NAME_EXISTED);
        }

        LegalCaseType legalCaseType = legalCaseTypeRepository
                .findById(request.getLegalCaseTypeId())
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_NOT_EXISTED));

        Integer maxId = legalRelationshipRepository.getMaxId(legalCaseType.getCodeName())
                .orElse(0);

        String legalRelationshipId = String.format("%s%03d", legalCaseType.getCodeName(), maxId + 1);
        if (legalRelationshipRepository.existsById(legalRelationshipId)) {
            throw new AppException(ErrorCode.LEGAL_RELATIONSHIP_EXISTED);
        }

        LegalRelationshipGroup legalRelationshipGroup = legalRelationshipGroupRepository
                .findById(request.getLegalRelationshipGroupId())
                .orElseThrow(() -> new AppException(ErrorCode.LEGAL_RELATIONSHIP_GROUP_NOT_EXISTED));

        legalRelationship.setLegalRelationshipId(legalRelationshipId);
        legalRelationship.setLegalCaseType(legalCaseType);
        legalRelationship.setLegalRelationshipGroup(legalRelationshipGroup);
        legalRelationshipRepository.save(legalRelationship);
    }

    @PreAuthorize("hasAuthority('UPDATE_LEGAL_RELATIONSHIP')")
    @Synchronized
    @Transactional
    public void update(String id, LegalRelationshipRequest request) {
        LegalRelationship legalRelationshipSaved = legalRelationshipRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.LEGAL_RELATIONSHIP_NOT_EXISTED));

        LegalCaseType legalCaseType = legalCaseTypeRepository
                .findById(request.getLegalCaseTypeId())
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_NOT_EXISTED));

        LegalRelationshipGroup legalRelationshipGroup = legalRelationshipGroupRepository
                .findById(request.getLegalRelationshipGroupId())
                .orElseThrow(() -> new AppException(ErrorCode.LEGAL_RELATIONSHIP_GROUP_NOT_EXISTED));

        legalRelationshipSaved.setLegalCaseType(legalCaseType);
        legalRelationshipSaved.setLegalRelationshipGroup(legalRelationshipGroup);

        legalRelationshipMapper.toLegalRelationship(request, legalRelationshipSaved);
        legalRelationshipRepository.save(legalRelationshipSaved);
    }

    @PreAuthorize("hasAuthority('DELETE_LEGAL_RELATIONSHIP')")
    @Synchronized
    @Transactional
    public void delete(String id) {
        LegalRelationship legalRelationship = legalRelationshipRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.LEGAL_RELATIONSHIP_NOT_EXISTED));
        legalRelationshipRepository.delete(legalRelationship);
    }

    @PreAuthorize("hasAuthority('VIEW_LEGAL_RELATIONSHIP')")
    public PageResponse<LegalRelationshipResponse> search(LegalRelationshipSearchRequest request, int page, int size, String sortBy) {
        Pageable pageable = PageRequest.of(page, size, org.springframework.data.domain.Sort.by(sortBy).ascending());

        Page<LegalRelationshipResponse> resultPage = legalRelationshipRepository.search(
                request.getLegalRelationshipId(),
                request.getLegalRelationshipName(),
                request.getLegalCaseTypeId(),
                request.getLegalRelationshipGroupId(),
                pageable
        ).map(legalRelationshipMapper::toLegalRelationshipResponse);


        return pageMapper.map(resultPage);
    }
}
