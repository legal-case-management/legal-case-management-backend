package server.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import server.entity.DecisionType;
import server.entity.LegalCase;
import server.entity.LegalCaseType;
import server.entity.enums.CourtIssued;

import java.util.List;
import java.util.Optional;

public interface DecisionTypeRepository extends JpaRepository<DecisionType, String> {
    boolean existsByDecisionTypeName(String decisionTypeName);

    @Query("""
            SELECT dt FROM DecisionType dt
            WHERE (:decisionTypeId IS NULL OR dt.decisionTypeId LIKE %:decisionTypeId%)
            AND (:decisionTypeName IS NULL OR dt.decisionTypeName LIKE %:decisionTypeName%)
            AND (:legalCaseTypeId IS NULL OR dt.legalCaseType.legalCaseTypeId = :legalCaseTypeId)
            AND (:courtIssued IS NULL OR dt.courtIssued = :courtIssued)
            AND (:theEndDecision IS NULL OR dt.theEndDecision = :theEndDecision)
            """)
    Page<DecisionType> search(
            String decisionTypeId,
            String decisionTypeName,
            String legalCaseTypeId,
            CourtIssued courtIssued,
            boolean theEndDecision,
            Pageable pageable
    );

    @Query("""
            SELECT MAX(CAST(SUBSTRING(dt.decisionTypeId, 3, 2) AS int))
            FROM DecisionType dt
            WHERE SUBSTRING(dt.decisionTypeId, 1, 2) = :legalCaseTypeCodeName
            """)
    Optional<Integer> getMaxId(String legalCaseTypeCodeName);

    List<DecisionType> getByLegalCaseType(LegalCaseType legalCaseType);
}
