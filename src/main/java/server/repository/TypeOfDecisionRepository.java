package server.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import server.entity.DecisionType;
import server.entity.enums.CourtIssued;

import java.util.Optional;

public interface TypeOfDecisionRepository extends JpaRepository<DecisionType, String> {
    boolean existsByTypeOfDecisionName(String typeOfDecisionName);

    @Query("""
            SELECT tod FROM DecisionType tod
            WHERE (:typeOfDecisionId IS NULL OR tod.typeOfDecisionId LIKE %:typeOfDecisionId%)
            AND (:typeOfDecisionName IS NULL OR tod.typeOfDecisionName LIKE %:typeOfDecisionName%)
            AND (:typeOfLegalCaseId IS NULL OR tod.typeOfLegalCase.typeOfLegalCaseId = :typeOfLegalCaseId)
            AND (:courtIssued IS NULL OR tod.courtIssued = :courtIssued)
            AND (:theEndDecision IS NULL OR tod.theEndDecision = :theEndDecision)
            """)
    Page<DecisionType> search(
            String typeOfDecisionId,
            String typeOfDecisionName,
            String typeOfLegalCaseId,
            CourtIssued courtIssued,
            boolean theEndDecision,
            Pageable pageable
    );

    @Query("""
            SELECT MAX(CAST(SUBSTRING(tod.typeOfDecisionId, 3, 2) AS int))
            FROM DecisionType tod
            WHERE SUBSTRING(tod.typeOfDecisionId, 1, 2) = :typeOfLegalCaseCodeName
            """)
    Optional<Integer> getMaxId(String typeOfLegalCaseCodeName);
}
