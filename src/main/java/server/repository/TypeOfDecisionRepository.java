package server.repository;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import server.entity.TypeOfDecision;
import server.entity.TypeOfLegalCase;
import server.entity.enums.CourtIssued;

import java.util.List;
import java.util.Optional;

public interface TypeOfDecisionRepository extends JpaRepository<TypeOfDecision, String> {
    boolean existsByTypeOfDecisionName(String typeOfDecisionName);
    @Query("SELECT tod FROM TypeOfDecision tod ORDER BY tod.typeOfDecisionId")
    List<TypeOfDecision> getTop50(Pageable pageable);

    @Query("""
            SELECT tod FROM TypeOfDecision tod
            WHERE (:typeOfDecisionId IS NULL OR tod.typeOfDecisionId = :typeOfDecisionId)
            AND (:typeOfDecisionName IS NULL OR tod.typeOfDecisionName LIKE %:typeOfDecisionName%)
            AND (:courtIssued IS NULL OR tod.courtIssued = :courtIssued)
            AND (:theEndDecision IS NULL OR tod.theEndDecision = :theEndDecision)
            """)
    List<TypeOfDecision> search(
            String typeOfDecisionId,
            String typeOfDecisionName,
            CourtIssued courtIssued,
            boolean theEndDecision
    );

    @Query("""
              SELECT MAX(CAST(SUBSTRING(tod.typeOfDecisionId, 3, 2) AS int))
              FROM TypeOfDecision tod
              WHERE SUBSTRING(tod.typeOfDecisionId, 1, 2) = :typeOfLegalCaseCodeName
            """)
    Optional<Integer> getMaxId(String typeOfLegalCaseCodeName);
}
