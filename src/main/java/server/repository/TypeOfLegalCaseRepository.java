package server.repository;

import io.lettuce.core.dynamic.annotation.Param;
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
    List<TypeOfLegalCase> search(
            String typeOfLegalCaseId,
            String typeOfLegalCaseName,
            String codeName
    );

    @Query("""
              SELECT MAX(CAST(SUBSTRING(t.typeOfLegalCaseId, 2, 2) AS int))
              FROM TypeOfLegalCase t
              WHERE SUBSTRING(t.typeOfLegalCaseId, 1, 1) = 'L'
            """)
    Optional<Integer> getMaxTypeOfLegalCaseId();
}
