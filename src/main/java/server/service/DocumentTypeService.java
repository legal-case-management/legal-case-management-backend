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
import server.dto.request.documentType.DocumentTypeRequest;
import server.dto.request.documentType.DocumentTypeSearchRequest;
import server.dto.response.PageResponse;
import server.dto.response.documentType.DocumentTypeResponse;
import server.entity.DocumentType;
import server.entity.LegalCaseType;
import server.exception.AppException;
import server.exception.ErrorCode;
import server.mapper.DocumentTypeMapper;
import server.mapper.PageMapper;
import server.repository.DocumentTypeRepository;
import server.repository.LegalCaseTypeRepository;

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
    @Async
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
    @Async
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
    @Async
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
