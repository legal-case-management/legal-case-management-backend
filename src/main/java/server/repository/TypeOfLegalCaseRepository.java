package server.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import server.entity.TypeOfLegalCase;

import java.util.List;
import java.util.Optional;

public interface TypeOfLegalCaseRepository extends JpaRepository<TypeOfLegalCase, String> {
    boolean existsByTypeOfLegalCaseName(String name);

    boolean existsByCodeName(String codeName);

    @Query("""
            SELECT t FROM TypeOfLegalCase t
            WHERE (:typeOfLegalCaseId IS NULL OR t.typeOfLegalCaseId = :typeOfLegalCaseId)
            AND (:typeOfLegalCaseName IS NULL OR t.typeOfLegalCaseName LIKE %:typeOfLegalCaseName%)
            AND (:codeName IS NULL OR t.codeName LIKE %:codeName%)
            """)
    Page<TypeOfLegalCase> search(
            String typeOfLegalCaseId,
            String typeOfLegalCaseName,
            String codeName,
            Pageable pageable
    );

    @Query("""
              SELECT MAX(CAST(SUBSTRING(t.typeOfLegalCaseId, 2, 2) AS int))
              FROM TypeOfLegalCase t
              WHERE SUBSTRING(t.typeOfLegalCaseId, 1, 1) = 'L'
            """)
    Optional<Integer> getMaxId();

    @Query("SELECT tol FROM TypeOfLegalCase tol ORDER BY tol.typeOfLegalCaseId")
    List<TypeOfLegalCase> getLimit(Pageable pageable);
}
