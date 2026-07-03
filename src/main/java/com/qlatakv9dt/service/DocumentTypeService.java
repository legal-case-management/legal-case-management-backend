package com.qlatakv9dt.service;

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
import com.qlatakv9dt.dto.request.documentType.DocumentTypeRequest;
import com.qlatakv9dt.dto.request.documentType.DocumentTypeSearchRequest;
import com.qlatakv9dt.dto.response.PageResponse;
import com.qlatakv9dt.dto.response.documentType.DocumentTypeResponse;
import com.qlatakv9dt.entity.DocumentType;
import com.qlatakv9dt.entity.LegalCaseType;
import com.qlatakv9dt.exception.AppException;
import com.qlatakv9dt.exception.ErrorCode;
import com.qlatakv9dt.mapper.DocumentTypeMapper;
import com.qlatakv9dt.mapper.PageMapper;
import com.qlatakv9dt.repository.DocumentTypeRepository;
import com.qlatakv9dt.repository.LegalCaseTypeRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class DocumentTypeService {
    DocumentTypeRepository documentTypeRepository;
    LegalCaseTypeRepository legalCaseTypeRepository;

    DocumentTypeMapper documentTypeMapper;
    PageMapper pageMapper;


    @PreAuthorize("hasAuthority('VIEW_DOCUMENT_TYPE')")
    public List<DocumentTypeResponse> getAll() {
        return documentTypeRepository
                .findAll()
                .stream().map(documentTypeMapper::toDocumentTypeResponse)
                .toList();
    }

    @PreAuthorize("hasAuthority('VIEW_DOCUMENT_TYPE')")
    public DocumentTypeResponse getById(String id) {
        return documentTypeRepository.findById(id)
                .map(documentTypeMapper::toDocumentTypeResponse)
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_DECISION_NOT_EXISTED));
    }

    @PreAuthorize("hasAuthority('CREATE_DOCUMENT_TYPE')")
    @Synchronized
    @Transactional
    public void create(DocumentTypeRequest request) {
        DocumentType documentType = DocumentType.builder().build();
        documentTypeMapper.toDocumentType(request, documentType);

        if (documentTypeRepository.existsByDocumentTypeName(documentType.getDocumentTypeName())) {
            throw new AppException(ErrorCode.TYPE_OF_DECISION_NAME_EXISTED);
        }

        LegalCaseType legalCaseType = legalCaseTypeRepository.findById(request.getLegalCaseTypeId())
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_NOT_EXISTED));

        Integer maxId = documentTypeRepository.getMaxId(legalCaseType.getCodeName()).orElse(0);
        String documentTypeId = String.format("TL%s%02d", legalCaseType.getCodeName(), maxId + 1);

        if (documentTypeRepository.existsById(documentTypeId)) {
            throw new AppException(ErrorCode.TYPE_OF_DECISION_EXISTED);
        }

        documentType.setDocumentTypeId(documentTypeId);
        documentType.setLegalCaseType(legalCaseType);

        documentTypeRepository.save(documentType);
    }


    @PreAuthorize("hasAuthority('UPDATE_DOCUMENT_TYPE')")
    @Synchronized
    @Transactional
    public void update(String id, DocumentTypeRequest request) {
        DocumentType existing = documentTypeRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_DECISION_NOT_EXISTED));

        documentTypeMapper.toDocumentType(request, existing);

        if(request.getLegalCaseTypeId() != null) {
            LegalCaseType legalCaseType = legalCaseTypeRepository.findById(request.getLegalCaseTypeId())
                    .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_NOT_EXISTED));
            existing.setLegalCaseType(legalCaseType);
        }

        documentTypeRepository.save(existing);
    }

    @PreAuthorize("hasAuthority('DELETE_DOCUMENT_TYPE')")
    @Synchronized
    @Transactional
    public void delete(String id) {
        DocumentType existing = documentTypeRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_DECISION_NOT_EXISTED));

        documentTypeRepository.delete(existing);
    }

    @PreAuthorize("hasAuthority('VIEW_DOCUMENT_TYPE')")
    public PageResponse<DocumentTypeResponse> search(DocumentTypeSearchRequest request, int page, int size, String sortBy) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(sortBy).ascending());

        Page<DocumentTypeResponse> resultPage = documentTypeRepository.search(
                request.getDocumentTypeId(),
                request.getDocumentTypeName(),
                request.getLegalCaseTypeId(),
                pageable
        ).map(documentTypeMapper::toDocumentTypeResponse);

        return pageMapper.map(resultPage);
    }

    @PreAuthorize("hasAuthority('VIEW_DOCUMENT_TYPE')")
    public List<DocumentTypeResponse> getByLegalCaseType(String legalCaseTypeId) {
        LegalCaseType legalCaseType = legalCaseTypeRepository.findById(legalCaseTypeId)
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_LEGAL_CASE_NOT_EXISTED));
        return documentTypeRepository
                .getByLegalCaseType(legalCaseType)
                .stream().map(documentTypeMapper::toDocumentTypeResponseBasic)
                .toList();
    }
}
