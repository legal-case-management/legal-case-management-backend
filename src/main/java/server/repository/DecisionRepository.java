package server.repository;

import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import server.entity.Decision;
import server.entity.LegalCase;

import java.util.List;
import java.util.Optional;

public interface DecisionRepository extends JpaRepository<Decision, String> {
    List<Decision> findAllByLegalCase(LegalCase legalCase);

    @Query("""
            SELECT MAX(CAST(SUBSTRING(lc.legalCaseId, 13, 2) AS int))
            FROM LegalCase lc
            WHERE SUBSTRING(lc.legalCaseId, 1, 10) = :legalCaseId
            AND SUBSTRING(lc.legalCaseId, 11, 2) = 'QD'
            """)
    Optional<Integer> getMaxId(
            @Param("legalCaseId") String legalCaseId
    );

}
