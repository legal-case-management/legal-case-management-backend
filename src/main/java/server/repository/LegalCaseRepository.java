package server.repository;

import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import server.entity.LegalCase;
import server.entity.enums.StatusOfLegalCase;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public interface LegalCaseRepository extends JpaRepository<LegalCase, String> {
    @Query("""
            SELECT lc FROM LegalCase lc 
            LEFT JOIN lc.judge j
            LEFT JOIN lc.legalRelationship lr
            WHERE (:acceptanceNumber IS NULL OR lc.acceptanceNumber LIKE %:acceptanceNumber%) 
            AND (:startAcceptanceDate IS NULL OR lc.acceptanceDate >= :startAcceptanceDate) 
            AND (:endAcceptanceDate IS NULL OR lc.acceptanceDate <= :endAcceptanceDate) 
            AND (:plaintiff IS NULL OR lc.plaintiff LIKE %:plaintiff%) 
            AND (:plaintiffAddress IS NULL OR lc.plaintiffAddress LIKE %:plaintiffAddress%) 
            AND (:defendant IS NULL OR lc.defendant LIKE %:defendant%) 
            AND (:defendantAddress IS NULL OR lc.defendantAddress LIKE %:defendantAddress%)
            AND (:legalRelationshipId IS NULL OR lr.legalRelationshipId = :legalRelationshipId)
            AND (:typeOfLegalCaseId IS NULL OR lr.typeOfLegalCase.typeOfLegalCaseId = :typeOfLegalCaseId)
            AND (:legalRelationshipGroupId IS NULL OR lr.legalRelationshipGroup.legalRelationshipGroupId = :legalRelationshipGroupId)
            AND (:statusOfLegalCase IS NULL OR lc.statusOfLegalCase = :statusOfLegalCase)
            AND (:judgeName IS NULL OR (j IS NOT NULL AND j.fullName LIKE %:judgeName%))
            AND (:batchId IS NULL OR (lc.batch IS NULL AND lc.batch.batchId = :batchId))
            AND (:storageDate IS NULL OR (YEAR(lc.storageDate) = YEAR(:storageDate) AND MONTH(lc.storageDate) = MONTH(:storageDate) AND DAY(lc.storageDate) = DAY(:storageDate)))
            """)
    List<LegalCase> search(
            String acceptanceNumber,
            LocalDate startAcceptanceDate,
            LocalDate endAcceptanceDate,
            String plaintiff,
            String plaintiffAddress,
            String defendant,
            String defendantAddress,
            String legalRelationshipId,
            String typeOfLegalCaseId,
            String legalRelationshipGroupId,
            StatusOfLegalCase statusOfLegalCase,
            String judgeName,
            String batchId,
            LocalDate storageDate
    );

    @Query("""
            SELECT lc FROM LegalCase lc
            LEFT JOIN lc.judge j
            LEFT JOIN lc.legalRelationship lr
            ORDER BY (lc.expiredDate - lc.acceptanceDate), YEAR(lc.acceptanceDate) DESC, lc.acceptanceDate DESC
            """)
    List<LegalCase> getTop50(Pageable pageable);

    @Query("""
                SELECT MAX(CAST(SUBSTRING(lc.legalCaseId, 7, 4) AS int))
                FROM LegalCase lc
                WHERE SUBSTRING(lc.legalCaseId, 1, 4) = :year
                  AND SUBSTRING(lc.legalCaseId, 5, 2) = :typeCode
            """)
    Optional<Integer> getMaxId(
            @Param("year") String year,
            @Param("typeCode") String typeCode
    );
}
