package server.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import server.entity.LegalCaseType;

import java.util.Optional;

public interface LegalCaseTypeRepository extends JpaRepository<LegalCaseType, String> {
    boolean existsByLegalCaseTypeName(String name);

    boolean existsByCodeName(String codeName);

    @Query("""
            SELECT lct FROM LegalCaseType lct
            WHERE (:legalCaseTypeId IS NULL OR lct.legalCaseTypeId LIKE %:legalCaseTypeId%)
            AND (:legalCaseTypeName IS NULL OR lct.legalCaseTypeName LIKE %:legalCaseTypeName%)
            AND (:codeName IS NULL OR lct.codeName LIKE %:codeName%)
            """)
    Page<LegalCaseType> search(
            String legalCaseTypeId,
            String legalCaseTypeName,
            String codeName,
            Pageable pageable
    );

    @Query("""
              SELECT MAX(CAST(SUBSTRING(t.legalCaseTypeId, 2, 2) AS int))
              FROM LegalCaseType t
              WHERE SUBSTRING(t.legalCaseTypeId, 1, 1) = 'L'
            """)
    Optional<Integer> getMaxId();
}
