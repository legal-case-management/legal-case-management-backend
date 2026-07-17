package com.qlatakv9dt.service;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.Synchronized;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.Sort;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.qlatakv9dt.dto.request.document.DocumentAcceptanceRequest;
import com.qlatakv9dt.dto.request.document.DocumentRequest;
import com.qlatakv9dt.dto.request.document.DocumentsRequest;
import com.qlatakv9dt.dto.response.document.DocumentResponse;
import com.qlatakv9dt.entity.Document;
import com.qlatakv9dt.entity.LegalCase;
import com.qlatakv9dt.entity.DocumentType;
import com.qlatakv9dt.enums.LegalCaseStatus;
import com.qlatakv9dt.exception.AppException;
import com.qlatakv9dt.exception.ErrorCode;
import com.qlatakv9dt.mapper.DocumentMapper;
import com.qlatakv9dt.repository.DocumentRepository;
import com.qlatakv9dt.repository.LegalCaseRepository;
import com.qlatakv9dt.repository.DocumentTypeRepository;
import com.qlatakv9dt.utils.DateUtils;

import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class DocumentService {
    DocumentRepository documentRepository;
    DocumentTypeRepository documentTypeRepository;
    LegalCaseRepository legalCaseRepository;

    DocumentMapper documentMapper;

    @PreAuthorize("hasAuthority('CREATE_DOCUMENT')")
    @Synchronized
    @Transactional
    public void create(DocumentRequest request) {
        LegalCase legalCase = legalCaseRepository.findById(request.getLegalCaseId())
                .orElseThrow(() -> new AppException(ErrorCode.LEGAL_CASE_NOT_EXISTED));
        createSingle(request, legalCase);
    }

    @PreAuthorize("hasAuthority('CREATE_DOCUMENT')")
    @Synchronized
    @Transactional
    public void importFromExcel(DocumentsRequest request) {
        for (DocumentAcceptanceRequest acceptanceRequest : request.getDocuments()) {
            List<LegalCase> matches = legalCaseRepository.findByAcceptanceNumberAndAcceptanceDateAndIsMediator(
                    acceptanceRequest.getAcceptanceNumber(),
                    acceptanceRequest.getAcceptanceDate(),
                    request.isMediator()
            );

            if (matches.isEmpty()) {
                throw new AppException(ErrorCode.LEGAL_CASE_NOT_FOUND_FOR_IMPORT, String.format(
                        "Không tìm thấy vụ án có số thụ lý %s, ngày %s, %s hòa giải viên",
                        acceptanceRequest.getAcceptanceNumber(),
                        DateUtils.formatLocalDate(acceptanceRequest.getAcceptanceDate()),
                        request.isMediator() ? "có" : "không có"
                ));
            }

            if (matches.size() >= 2) {
                throw new AppException(ErrorCode.LEGAL_CASE_AMBIGUOUS_FOR_IMPORT, String.format(
                        "Tìm thấy %d vụ án có số thụ lý %s, ngày %s, %s hòa giải viên",
                        matches.size(),
                        acceptanceRequest.getAcceptanceNumber(),
                        DateUtils.formatLocalDate(acceptanceRequest.getAcceptanceDate()),
                        request.isMediator() ? "có" : "không có"
                ));
            }

            LegalCase legalCase = matches.get(0);

            DocumentRequest documentRequest = DocumentRequest.builder()
                    .documentNumber(acceptanceRequest.getDocumentNumber())
                    .releaseDate(acceptanceRequest.getReleaseDate())
                    .note(acceptanceRequest.getNote())
                    .documentTypeId(acceptanceRequest.getDocumentTypeId())
                    .legalCaseId(legalCase.getLegalCaseId())
                    .build();

            createSingle(documentRequest, legalCase);
        }
    }

    private void createSingle(DocumentRequest request, LegalCase legalCase) {
        Document document = Document.builder().build();
        documentMapper.toDocument(request, document);

        DocumentType documentType = documentTypeRepository.findById(request.getDocumentTypeId())
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_DECISION_NOT_EXISTED));

        if (!documentType.getPreStatuses().isEmpty()) {
            for (LegalCaseStatus status : documentType.getPreStatuses()) {
                if (status.equals(legalCase.getLegalCaseStatus())) {
                    if (documentType.getExtensionPeriod() > 0) {
                        legalCase.setExpiredDate(document.getReleaseDate().plusMonths(documentType.getExtensionPeriod()));
                    }

                    if (documentType.getPostStatus() != null){
                        legalCase.setLegalCaseStatus(documentType.getPostStatus());
                        if (documentType.getPostStatus().equals(LegalCaseStatus.TEMPORARY_SUSPENSION))
                            legalCase.setExpiredDate(null);
                    }

                    break;
                }
            }
        }

        Integer maxId = documentRepository.getMaxId(legalCase.getLegalCaseId()).orElse(0);
        String decisionId = String.format("%sTL%02d", legalCase.getLegalCaseId(), maxId + 1);
        if (documentRepository.existsById(decisionId))
            throw new AppException(ErrorCode.DECISION_EXISTED);

        document.setDocumentId(decisionId);
        document.setDocumentType(documentType);
        document.setLegalCase(legalCase);
        document.setStorageDate(LocalDateTime.now());

        documentRepository.save(document);
    }

    @PreAuthorize("hasAuthority('UPDATE_DOCUMENT')")
    @Synchronized
    @Transactional
    public void update(String id, DocumentRequest request) {
        Document document = documentRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.DECISION_NOT_EXISTED));
        documentMapper.toDocument(request, document);
        documentRepository.save(document);
    }

    @PreAuthorize("hasAuthority('DELETE_DOCUMENT')")
    @Synchronized
    @Transactional
    public void delete(String id) {
        Document document = documentRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.DECISION_NOT_EXISTED));
        documentRepository.delete(document);
    }

    public List<DocumentResponse> getByLegalCase(String legalCaseId) {
        LegalCase legalCase = legalCaseRepository.findById(legalCaseId)
                .orElseThrow(() -> new AppException(ErrorCode.LEGAL_CASE_NOT_EXISTED));
        return documentRepository
                .findAllByLegalCase(legalCase, Sort.by("releaseDate").descending())
                .stream().map(documentMapper::toDocumentResponse)
                .toList();
    }
}
