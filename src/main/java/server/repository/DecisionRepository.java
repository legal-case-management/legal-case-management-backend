package server.repository;

import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import server.entity.Decision;
import server.entity.LegalCase;

import java.util.List;
import java.util.Optional;

public interface DecisionRepository extends JpaRepository<Decision, String> {
    List<Decision> findAllByLegalCase(LegalCase legalCase, Sort sort);

    @Query("""
            SELECT MAX(CAST(SUBSTRING(d.decisionId, 14, 2) AS int))
            FROM Decision d
            WHERE SUBSTRING(d.decisionId, 1, 11) = :legalCaseId
            AND SUBSTRING(d.decisionId, 12, 2) = 'QD'
            """)
    Optional<Integer> getMaxId(
            @Param("legalCaseId") String legalCaseId
    );
}
