package server.repository;

import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import server.entity.LegalRelationship;
import server.entity.TypeOfLegalCase;

import java.util.List;
import java.util.Optional;

public interface LegalRelationshipRepository extends JpaRepository<LegalRelationship, String> {
    boolean existsByLegalRelationshipName(String legalRelationshipName);

    @Query("""
              SELECT MAX(CAST(SUBSTRING(lr.legalRelationshipId, 3, 3) AS int))
              FROM LegalRelationship lr
              WHERE SUBSTRING(lr.legalRelationshipId, 1, 2) = :codeName
            """)
    Optional<Integer> getMaxId(
            @Param("codeName") String codeName
    );

    @Query("SELECT lr FROM LegalRelationship lr ORDER BY lr.legalRelationshipId")
    List<LegalRelationship> getTop50(Pageable pageable);

    @Query("""
            SELECT lr FROM LegalRelationship lr
            LEFT JOIN lr.typeOfLegalCase tolc
            LEFT JOIN lr.legalRelationshipGroup lrg
            WHERE (:legalRelationshipId IS NULL OR lr.legalRelationshipId LIKE %:legalRelationshipId%)
            AND (:legalRelationshipName IS NULL OR lr.legalRelationshipName LIKE %:legalRelationshipName%)
            AND (:typeOfLegalCaseId IS NULL OR tolc.typeOfLegalCaseId LIKE %:typeOfLegalCaseId%)
            AND (:typeOfLegalCaseName IS NULL OR tolc.typeOfLegalCaseName LIKE %:typeOfLegalCaseName%)
            AND (:legalRelationshipGroupId IS NULL OR lrg.legalRelationshipGroupId LIKE %:legalRelationshipGroupId%)
            AND (:legalRelationshipGroupName IS NULL OR lrg.legalRelationshipGroupName LIKE %:legalRelationshipGroupName%)
            ORDER BY tolc.typeOfLegalCaseId, lr.legalRelationshipId
            """)
    List<LegalRelationship> search(
            String legalRelationshipId,
            String legalRelationshipName,
            String typeOfLegalCaseId,
            String typeOfLegalCaseName,
            String legalRelationshipGroupId,
            String legalRelationshipGroupName
    );

    @Query("""
            SELECT lr FROM LegalRelationship lr ORDER BY lr.typeOfLegalCase.typeOfLegalCaseId, lr.legalRelationshipId
            """)
    List<LegalRelationship> getAll();
}
