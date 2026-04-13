package server.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import server.entity.DocumentType;
import server.entity.LegalCaseType;

import java.util.List;
import java.util.Optional;

public interface DocumentTypeRepository extends JpaRepository<DocumentType, String> {
    boolean existsByDocumentTypeName(String decisionTypeName);

    @Query("""
            SELECT dt FROM DocumentType dt
            WHERE (:documentTypeId IS NULL OR dt.documentTypeId LIKE %:documentTypeId%)
            AND (:documentTypeName IS NULL OR dt.documentTypeName LIKE %:documentTypeName%)
            AND (:legalCaseTypeId IS NULL OR dt.legalCaseType.legalCaseTypeId = :legalCaseTypeId)
            """)
    Page<DocumentType> search(
            String documentTypeId,
            String documentTypeName,
            String legalCaseTypeId,
            Pageable pageable
    );

    @Query("""
            SELECT MAX(CAST(SUBSTRING(dt.documentTypeId, 5, 2) AS int))
            FROM DocumentType dt
            WHERE SUBSTRING(dt.documentTypeId, 3, 2) = :legalCaseTypeCodeName
            """)
    Optional<Integer> getMaxId(String legalCaseTypeCodeName);

    List<DocumentType> getByLegalCaseType(LegalCaseType legalCaseType);
}
