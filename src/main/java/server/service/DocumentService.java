package server.service;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.Synchronized;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.Sort;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import server.dto.request.document.DocumentRequest;
import server.dto.response.document.DocumentResponse;
import server.entity.Document;
import server.entity.LegalCase;
import server.entity.DocumentType;
import server.entity.enums.LegalCaseStatus;
import server.exception.AppException;
import server.exception.ErrorCode;
import server.mapper.DocumentMapper;
import server.repository.DocumentRepository;
import server.repository.LegalCaseRepository;
import server.repository.DocumentTypeRepository;

import java.time.LocalDate;
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


    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void create(DocumentRequest request) {
        Document document = Document.builder().build();
        documentMapper.toDocument(request, document);

        DocumentType documentType = documentTypeRepository.findById(request.getDocumentTypeId())
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_DECISION_NOT_EXISTED));

        LegalCase legalCase = legalCaseRepository.findById(request.getLegalCaseId())
                .orElseThrow(() -> new AppException(ErrorCode.LEGAL_CASE_NOT_EXISTED));


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

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void update(String id, DocumentRequest request) {
        Document document = documentRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.DECISION_NOT_EXISTED));
        documentMapper.toDocument(request, document);
        documentRepository.save(document);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
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
