package server.repository;

import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import server.entity.LegalRelationship;

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

    @Query("""
            SELECT lr FROM LegalRelationship lr
            LEFT JOIN lr.legalCaseType lt
            LEFT JOIN lr.legalRelationshipGroup lrg
            WHERE (:legalRelationshipId IS NULL OR lr.legalRelationshipId LIKE %:legalRelationshipId%)
            AND (:legalRelationshipName IS NULL OR lr.legalRelationshipName LIKE %:legalRelationshipName%)
            AND (:legalCaseTypeId IS NULL OR lt.legalCaseTypeId LIKE %:legalCaseTypeId%)
            AND (:legalRelationshipGroupId IS NULL OR lrg.legalRelationshipGroupId LIKE %:legalRelationshipGroupId%)
            ORDER BY lt.legalCaseTypeId, lr.legalRelationshipId
            """)
    Page<LegalRelationship> search(
            String legalRelationshipId,
            String legalRelationshipName,
            String legalCaseTypeId,
            String legalRelationshipGroupId,
            Pageable pageable
    );

    @Query("""
            SELECT lr FROM LegalRelationship lr ORDER BY lr.legalCaseType.legalCaseTypeId, lr.legalRelationshipId
            """)
    List<LegalRelationship> getAll();
}
