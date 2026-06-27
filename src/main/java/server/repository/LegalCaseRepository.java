package server.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;
import server.entity.*;
import server.entity.enums.LegalCaseStatus;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

public interface LegalCaseRepository extends JpaRepository<LegalCase, String> {
    long countLegalCaseByBatch(Batch batch);
    long countLegalCasesByMediator(Mediator mediator);

    @Query("""
                SELECT DISTINCT lc FROM LegalCase lc
                LEFT JOIN lc.judge j
                LEFT JOIN lc.legalRelationship lr
                LEFT JOIN lc.litigants l
                WHERE (:acceptanceNumber IS NULL OR lc.acceptanceNumber ILIKE %:acceptanceNumber%)
                AND (cast(:startAcceptanceDate as date) IS NULL OR lc.acceptanceDate >= :startAcceptanceDate)
                AND (cast(:endAcceptanceDate as date) IS NULL OR lc.acceptanceDate <= :endAcceptanceDate)
                AND (:legalRelationshipId IS NULL OR lr.legalRelationshipId = :legalRelationshipId)
                AND (:legalCaseTypeId IS NULL OR lr.legalCaseType.legalCaseTypeId = :legalCaseTypeId)
                AND (:legalRelationshipGroupId IS NULL OR lr.legalRelationshipGroup.legalRelationshipGroupId = :legalRelationshipGroupId)
                AND (:litigantName IS NULL OR l.name ILIKE %:litigantName%)
                AND (:litigantYearOfBirth IS NULL OR l.yearOfBirth = :litigantYearOfBirth)
                AND (:litigantAddress IS NULL OR l.address ILIKE %:litigantAddress%)
                AND (:legalCaseStatus IS NULL OR lc.legalCaseStatus = :legalCaseStatus)
                AND (:judgeId IS NULL OR (j IS NOT NULL AND j.officerId = :judgeId))
                AND (:batchId IS NULL OR (lc.batch IS NOT NULL AND lc.batch.batchId = :batchId))
                AND (cast(:startStorageDate as timestamp) IS NULL OR lc.storageDate >= :startStorageDate)
                AND (cast(:endStorageDate as timestamp) IS NULL OR lc.storageDate <= :endStorageDate)
            """)
    Page<LegalCase> search(
            @Param("acceptanceNumber") String acceptanceNumber,
            @Param("startAcceptanceDate") LocalDate startAcceptanceDate,
            @Param("endAcceptanceDate") LocalDate endAcceptanceDate,
            @Param("legalRelationshipId") String legalRelationshipId,
            @Param("legalCaseTypeId") String legalCaseTypeId,
            @Param("legalRelationshipGroupId") String legalRelationshipGroupId,
            @Param("litigantName") String litigantName,
            @Param("litigantYearOfBirth") String litigantYearOfBirth,
            @Param("litigantAddress") String litigantAddress,
            @Param("legalCaseStatus") LegalCaseStatus legalCaseStatus,
            @Param("judgeId") String judgeId,
            @Param("batchId") String batchId,
            @Param("startStorageDate") LocalDateTime startStorageDate,
            @Param("endStorageDate") LocalDateTime endStorageDate,
            Pageable pageable
    );

    @Query("""
                SELECT MAX(CAST(SUBSTRING(lc.legalCaseId, 7, 5) AS int))
                FROM LegalCase lc
                WHERE SUBSTRING(lc.legalCaseId, 1, 4) = :year
                  AND SUBSTRING(lc.legalCaseId, 5, 2) = :typeCode
            """)
    Optional<Integer> getMaxId(
            @Param("year") String year,
            @Param("typeCode") String typeCode
    );

    @Query("""
        SELECT lc
        FROM LegalCase lc
        WHERE lc.legalCaseId IN :legalCaseIds
          AND lc.legalCaseStatus = 'WAITING_FOR_ASSIGNMENT'
          AND lc.judge IS NULL
          AND lc.mediator IS NULL
          AND lc.legalRelationship.legalRelationshipGroup = :legalRelationshipGroup
    """)
    List<LegalCase> getAssignmentListWithoutMediator(
            @Param("legalCaseIds") Iterable<String> legalCaseIds,
            @Param("legalRelationshipGroup") LegalRelationshipGroup legalRelationshipGroup
    );

    @Query("""
        SELECT lc
        FROM LegalCase lc
        WHERE lc.legalCaseId IN :legalCaseIds
          AND lc.legalCaseStatus = 'WAITING_FOR_ASSIGNMENT'
          AND lc.judge IS NULL
          AND lc.mediator IS NOT NULL
    """)
    List<LegalCase> getAssignmentListWithMediator(
            @Param("legalCaseIds") Iterable<String> legalCaseIds
    );

    @Query("""
            SELECT lc FROM LegalCase lc
            LEFT JOIN lc.legalRelationship lr
            WHERE lc.legalCaseStatus = 'WAITING_FOR_ASSIGNMENT'
            AND lc.judge IS NULL
            AND lc.mediator IS NOT NULL
            """)
    Page<LegalCase> getAssignmentListWithMediator(Pageable pageable);

    @Query("""
            SELECT lc FROM LegalCase lc
            LEFT JOIN lc.legalRelationship lr
            WHERE lc.legalCaseStatus = 'WAITING_FOR_ASSIGNMENT'
            AND lc.judge IS NULL
            AND lr.legalRelationshipGroup.legalRelationshipGroupId = :legalRelationshipGroupId
            """)
    Page<LegalCase> getAssignmentListWithoutMediator(String legalRelationshipGroupId, Pageable pageable);

    @Modifying
    @Transactional
    @Query("""
        UPDATE LegalCase lc
        SET lc.legalCaseStatus = 'WAITING_FOR_ASSIGNMENT',
            lc.assignment = NULL,
            lc.assignmentDate = NULL,
            lc.expiredDate = NULL
        WHERE lc.judge IS NULL
        """)
    int updateWaitingForAssignment();

    @Modifying
    @Transactional
    @Query("""
        UPDATE LegalCase lc
        SET lc.legalCaseStatus = 'OVERDUE'
        WHERE lc.judge IS NOT NULL
            AND lc.legalCaseStatus = 'IN_PROCESS'
            AND lc.expiredDate < CURRENT_TIMESTAMP
        """)
    int updateOverdue();

    @Query("""
                SELECT lc FROM LegalCase lc
                WHERE lc.expiredDate BETWEEN :now AND :futureDate
                  AND lc.judge IS NOT NULL
            """)
    List<LegalCase> findCasesExpiringWithinDays(
            @Param("now") LocalDate now,
            @Param("futureDate") LocalDate futureDate
    );

    long countLegalCasesByJudge(Judge judge);

    @Query("""
        SELECT
            lct.legalCaseTypeId,
            lct.legalCaseTypeName,
            COUNT(lc)
        FROM LegalCase lc
        JOIN lc.legalRelationship.legalCaseType lct
        WHERE lc.acceptanceDate BETWEEN :startDate AND :endDate
        GROUP BY lct.legalCaseTypeId, lct.legalCaseTypeName
        ORDER BY lct.legalCaseTypeId
    """)
    List<Object[]> getPieByLegalCaseType(
            @Param("startDate") LocalDate startDate,
            @Param("endDate") LocalDate endDate
    );

    @Query("""
        SELECT
            lrg.legalRelationshipGroupName,
            SUM(CASE WHEN lc.mediator IS NOT NULL THEN 1 ELSE 0 END),
            SUM(CASE WHEN lc.mediator IS NULL THEN 1 ELSE 0 END)
        FROM LegalCase lc
        LEFT JOIN lc.legalRelationship.legalRelationshipGroup lrg
        WHERE lc.acceptanceDate BETWEEN :startDate AND :endDate
        GROUP BY lrg.legalRelationshipGroupId, lrg.legalRelationshipGroupName
        ORDER BY lrg.legalRelationshipGroupId
    """)
    List<Object[]> getPieByLegalRelationshipGroup(
            @Param("startDate") LocalDate startDate,
            @Param("endDate") LocalDate endDate
    );

    @Query("""
    SELECT YEAR(lc.acceptanceDate),
           MONTH(lc.acceptanceDate),
           lct.legalCaseTypeId,
           lct.legalCaseTypeName,
           COUNT(lc)
    FROM LegalCase lc
    JOIN lc.legalRelationship.legalCaseType lct
    WHERE lc.acceptanceDate BETWEEN :startDate AND :endDate
    GROUP BY YEAR(lc.acceptanceDate), MONTH(lc.acceptanceDate), lct.legalCaseTypeId, lct.legalCaseTypeName
    ORDER BY YEAR(lc.acceptanceDate), MONTH(lc.acceptanceDate)
    """)
    List<Object[]> getTimelineByLegalCaseTypeMonth(
            @Param("startDate") LocalDate startDate,
            @Param("endDate") LocalDate endDate
    );

    @Query("""
    SELECT YEAR(lc.acceptanceDate),
           QUARTER(lc.acceptanceDate),
           lct.legalCaseTypeId,
           lct.legalCaseTypeName,
           COUNT(lc)
    FROM LegalCase lc
    JOIN lc.legalRelationship.legalCaseType lct
    WHERE lc.acceptanceDate BETWEEN :startDate AND :endDate
    GROUP BY YEAR(lc.acceptanceDate), QUARTER(lc.acceptanceDate), lct.legalCaseTypeId, lct.legalCaseTypeName
    ORDER BY YEAR(lc.acceptanceDate), QUARTER(lc.acceptanceDate)
    """)
    List<Object[]> getTimelineByLegalCaseTypeQuarter(
            @Param("startDate") LocalDate startDate,
            @Param("endDate") LocalDate endDate
    );

    @Query("""
    SELECT YEAR(lc.acceptanceDate),
           lct.legalCaseTypeId,
           lct.legalCaseTypeName,
           COUNT(lc)
    FROM LegalCase lc
    JOIN lc.legalRelationship.legalCaseType lct
    WHERE lc.acceptanceDate BETWEEN :startDate AND :endDate
    GROUP BY YEAR(lc.acceptanceDate), lct.legalCaseTypeId, lct.legalCaseTypeName
    ORDER BY YEAR(lc.acceptanceDate)
    """)
    List<Object[]> getTimelineByLegalCaseTypeYear(
            @Param("startDate") LocalDate startDate,
            @Param("endDate") LocalDate endDate
    );

    @Query("""
    SELECT YEAR(lc.acceptanceDate),
           MONTH(lc.acceptanceDate),
           lrg.legalRelationshipGroupId,
           lrg.legalRelationshipGroupName,
           SUM(CASE WHEN lc.mediator IS NOT NULL THEN 1L ELSE 0L END),
           SUM(CASE WHEN lc.mediator IS NULL THEN 1L ELSE 0L END)
    FROM LegalCase lc
    LEFT JOIN lc.legalRelationship.legalRelationshipGroup lrg
    WHERE lc.acceptanceDate BETWEEN :startDate AND :endDate
    GROUP BY YEAR(lc.acceptanceDate), MONTH(lc.acceptanceDate), lrg.legalRelationshipGroupId, lrg.legalRelationshipGroupName
    ORDER BY YEAR(lc.acceptanceDate), MONTH(lc.acceptanceDate)
    """)
    List<Object[]> getTimelineByLegalRelationshipGroupMonth(
            @Param("startDate") LocalDate startDate,
            @Param("endDate") LocalDate endDate
    );

    @Query("""
    SELECT YEAR(lc.acceptanceDate),
           QUARTER(lc.acceptanceDate),
           lrg.legalRelationshipGroupId,
           lrg.legalRelationshipGroupName,
           SUM(CASE WHEN lc.mediator IS NOT NULL THEN 1L ELSE 0L END),
           SUM(CASE WHEN lc.mediator IS NULL THEN 1L ELSE 0L END)
    FROM LegalCase lc
    LEFT JOIN lc.legalRelationship.legalRelationshipGroup lrg
    WHERE lc.acceptanceDate BETWEEN :startDate AND :endDate
    GROUP BY YEAR(lc.acceptanceDate), QUARTER(lc.acceptanceDate), lrg.legalRelationshipGroupId, lrg.legalRelationshipGroupName
    ORDER BY YEAR(lc.acceptanceDate), QUARTER(lc.acceptanceDate)
    """)
    List<Object[]> getTimelineByLegalRelationshipGroupQuarter(
            @Param("startDate") LocalDate startDate,
            @Param("endDate") LocalDate endDate
    );

    @Query("""
    SELECT YEAR(lc.acceptanceDate),
           lrg.legalRelationshipGroupId,
           lrg.legalRelationshipGroupName,
           SUM(CASE WHEN lc.mediator IS NOT NULL THEN 1L ELSE 0L END),
           SUM(CASE WHEN lc.mediator IS NULL THEN 1L ELSE 0L END)
    FROM LegalCase lc
    LEFT JOIN lc.legalRelationship.legalRelationshipGroup lrg
    WHERE lc.acceptanceDate BETWEEN :startDate AND :endDate
    GROUP BY YEAR(lc.acceptanceDate), lrg.legalRelationshipGroupId, lrg.legalRelationshipGroupName
    ORDER BY YEAR(lc.acceptanceDate)
    """)
    List<Object[]> getTimelineByLegalRelationshipGroupYear(
            @Param("startDate") LocalDate startDate,
            @Param("endDate") LocalDate endDate
    );
}
