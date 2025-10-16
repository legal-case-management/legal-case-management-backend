package server.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import server.entity.LegalCaseType;

import java.util.Optional;

public interface TypeOfLegalCaseRepository extends JpaRepository<LegalCaseType, String> {
    boolean existsByTypeOfLegalCaseName(String name);

    boolean existsByCodeName(String codeName);

    @Query("""
            SELECT t FROM LegalCaseType t
            WHERE (:typeOfLegalCaseId IS NULL OR t.typeOfLegalCaseId LIKE %:typeOfLegalCaseId%)
            AND (:typeOfLegalCaseName IS NULL OR t.typeOfLegalCaseName LIKE %:typeOfLegalCaseName%)
            AND (:codeName IS NULL OR t.codeName LIKE %:codeName%)
            """)
    Page<LegalCaseType> search(
            String typeOfLegalCaseId,
            String typeOfLegalCaseName,
            String codeName,
            Pageable pageable
    );

    @Query("""
              SELECT MAX(CAST(SUBSTRING(t.typeOfLegalCaseId, 2, 2) AS int))
              FROM LegalCaseType t
              WHERE SUBSTRING(t.typeOfLegalCaseId, 1, 1) = 'L'
            """)
    Optional<Integer> getMaxId();
}
