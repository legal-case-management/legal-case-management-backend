package server.repository;

import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import server.entity.LegalCase;
import server.entity.enums.LegalRelationship;
import server.entity.enums.StatusOfLegalCase;
import server.entity.enums.TypeOfLegalCase;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public interface LegalCaseRepository extends JpaRepository<LegalCase, String> {
    @Query("""
SELECT lc FROM LegalCase lc 
            LEFT JOIN lc.judge j 
            WHERE (:acceptanceNumber IS NULL OR lc.acceptanceNumber LIKE %:acceptanceNumber%) 
            AND (:startAcceptanceDate IS NULL OR lc.acceptanceDate >= :startAcceptanceDate) 
            AND (:endAcceptanceDate IS NULL OR lc.acceptanceDate <= :endAcceptanceDate) 
            AND (:plaintiff IS NULL OR lc.plaintiff LIKE %:plaintiff%) 
            AND (:defendant IS NULL OR lc.defendant LIKE %:defendant%) 
            AND (:typeOfLegalCase IS NULL OR lc.typeOfLegalCase = :typeOfLegalCase) 
            AND (:typeOfLegalCase IS NULL OR :legalRelationship IS NULL OR lc.legalRelationship = :legalRelationship)
            AND (:statusOfLegalCase IS NULL OR lc.statusOfLegalCase = :statusOfLegalCase)
            AND (:judgeName IS NULL OR (j IS NOT NULL AND j.fullName LIKE %:judgeName%))
            AND (:batchId IS NULL OR (lc.batch IS NULL AND lc.batch.batchId = :batchId))
            AND (:storageDate IS NULL OR lc.storageDate = :storageDate)
            """)
    List<LegalCase> searchLegalCases(
            String acceptanceNumber,
            LocalDate startAcceptanceDate,
            LocalDate endAcceptanceDate,
            String plaintiff,
            String defendant,
            TypeOfLegalCase typeOfLegalCase,
            LegalRelationship legalRelationship,
            StatusOfLegalCase statusOfLegalCase,
            String judgeName,
            String batchId,
            LocalDate storageDate
    );

    @Query("SELECT lc FROM LegalCase lc ORDER BY lc.acceptanceDate DESC")
    List<LegalCase> getLatest50LegalCases(Pageable pageable);

    @Query("""
                SELECT MAX(CAST(SUBSTRING(lc.legalCaseId, 7, 4) AS int))
                FROM LegalCase lc
                WHERE SUBSTRING(lc.legalCaseId, 1, 4) = :year
                  AND SUBSTRING(lc.legalCaseId, 5, 2) = :typeCode
            """)
    Optional<Integer> getMaxLegalCaseId(
            @Param("year") String year,
            @Param("typeCode") String typeCode
    );
}
