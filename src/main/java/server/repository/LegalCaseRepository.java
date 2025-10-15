package server.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;
import server.entity.Batch;
import server.entity.LegalCase;
import server.entity.LegalRelationship;
import server.entity.LegalRelationshipGroup;
import server.entity.enums.LegalCaseStatus;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

public interface LegalCaseRepository extends JpaRepository<LegalCase, String> {
    Long countLegalCaseByBatch(Batch batch);

    @Query("""
                SELECT DISTINCT lc FROM LegalCase lc
                LEFT JOIN lc.judge j
                LEFT JOIN lc.legalRelationship lr
                LEFT JOIN lc.litigants l
                WHERE (:acceptanceNumber IS NULL OR lc.acceptanceNumber LIKE %:acceptanceNumber%)
                AND (cast(:startAcceptanceDate as date) IS NULL OR lc.acceptanceDate >= :startAcceptanceDate)
                AND (cast(:endAcceptanceDate as date) IS NULL OR lc.acceptanceDate <= :endAcceptanceDate)
                AND (:legalRelationshipId IS NULL OR lr.legalRelationshipId = :legalRelationshipId)
                AND (:legalCaseTypeId IS NULL OR lr.legalCaseType.legalCaseTypeId = :legalCaseTypeId)
                AND (:legalRelationshipGroupId IS NULL OR lr.legalRelationshipGroup.legalRelationshipGroupId = :legalRelationshipGroupId)
                AND (:litigantName IS NULL OR l.name LIKE %:litigantName%)
                AND (:litigantYearOfBirth IS NULL OR l.yearOfBirth = :litigantYearOfBirth)
                AND (:litigantAddress IS NULL OR l.address LIKE %:litigantAddress%)
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
                SELECT MAX(CAST(SUBSTRING(lc.legalCaseId, 7, 4) AS int))
                FROM LegalCase lc
                WHERE SUBSTRING(lc.legalCaseId, 1, 4) = :year
                  AND SUBSTRING(lc.legalCaseId, 5, 2) = :typeCode
            """)
    Optional<Integer> getMaxId(
            @Param("year") String year,
            @Param("typeCode") String typeCode
    );

    @Query("""
            SELECT lc FROM LegalCase lc
            WHERE lc.legalCaseId IN :legalCaseIds
            AND lc.legalCaseStatus = 'WAITING_FOR_ASSIGNMENT'
            AND lc.judge IS NULL
            AND lc.legalRelationship.legalRelationshipGroup.legalRelationshipGroupId = :legalRelationshipGroupId
            """)
    List<LegalCase> getAssignAssignment(Iterable<String> legalCaseIds, String legalRelationshipGroupId);


    @Query("""
            SELECT lc FROM LegalCase lc
            LEFT JOIN lc.legalRelationship lr
            WHERE lc.legalCaseStatus = 'WAITING_FOR_ASSIGNMENT'
            AND lc.judge IS NULL
            AND lc.mediator IS NOT NULL
            """)
    Page<LegalCase> getAssignmentListHasMediator(Pageable pageable);


    @Query("""
            SELECT lc FROM LegalCase lc
            LEFT JOIN lc.legalRelationship lr
            WHERE lc.legalCaseStatus = 'WAITING_FOR_ASSIGNMENT'
            AND lc.judge IS NULL
            AND lr.legalRelationshipGroup.legalRelationshipGroupId = :legalRelationshipGroupId
            """)
    Page<LegalCase> getAssignmentListByLegalRelationshipGroup(String legalRelationshipGroupId, Pageable pageable);

    @Query("""
            SELECT lc FROM LegalCase lc
            LEFT JOIN lc.legalRelationship lr
            LEFT JOIN lc.batch b
            WHERE (lc.legalCaseStatus = 'IN_PROCESS'
                   OR lc.legalCaseStatus = 'OVERDUE'
                   OR lc.legalCaseStatus = 'WAITING_FOR_ASSIGNMENT'
                   OR lc.legalCaseStatus = 'TEMPORARY_SUSPENSION')
                  AND b.storageDate < :milestoneDate
            """)
    Page<LegalCase> getPending(
            @Param("milestoneDate") LocalDate milestoneDate,
            Pageable pageable
    );

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
}
