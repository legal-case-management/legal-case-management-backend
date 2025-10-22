package server.repository;

import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import server.dto.response.judge.JudgeResponse;
import server.entity.Judge;
import org.springframework.data.jpa.repository.JpaRepository;
import server.entity.LegalRelationshipGroup;
import server.entity.enums.OfficerStatus;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

public interface JudgeRepository extends JpaRepository<Judge, String> {
    @Query("""
            SELECT new server.dto.response.judge.JudgeResponse(
                j.officerId,
                j.lastName,
                j.firstName,
                j.fullName,
                j.officerStatus,
                j.account.email,
                j.maxNumberOfLegalCase,
                SUM(CASE WHEN lc IS NOT NULL THEN 1 ELSE 0 END),
                SUM(CASE WHEN lc.legalCaseStatus = 'IN_PROCESS' THEN 1 ELSE 0 END),
                SUM(CASE WHEN lc.legalCaseStatus = 'TEMPORARY_SUSPENSION' THEN 1 ELSE 0 END),
                SUM(CASE WHEN lc.legalCaseStatus = 'OVERDUE' THEN 1 ELSE 0 END),
                SUM(CASE WHEN (lc.legalCaseStatus = 'CANCELED' OR lc.legalCaseStatus = 'EDITED') THEN 1 ELSE 0 END)
            )
            FROM Judge j
            LEFT JOIN j.legalCases lc
            LEFT JOIN lc.batch b
            WHERE  b.storageDate >= :milestoneDate
                    AND(:officerId IS NULL OR j.officerId LIKE %:officerId%)
                    AND (:fullName IS NULL OR j.fullName LIKE %:fullName%)
                    AND (:officerStatus IS NULL OR j.officerStatus = :officerStatus)
            GROUP BY j.officerId, j.lastName, j.firstName, j.fullName,
                     j.maxNumberOfLegalCase, j.officerStatus, j.account.email
            ORDER BY j.officerId
            """)
    Page<JudgeResponse> search(
            String officerId,
            String fullName,
            OfficerStatus officerStatus,
            @Param("milestoneDate") LocalDateTime milestoneDate,
            Pageable pageable
    );

    @Query("""
              SELECT MAX(CAST(SUBSTRING(j.officerId, 3, 2) AS int))
              FROM Judge j
              WHERE SUBSTRING(j.officerId, 1, 2) = 'TP'
            """)
    Optional<Integer> getMaxId();

    @Query("""
        SELECT
            j.officerId,
            null,
            null,
            j.fullName,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null
        FROM Judge j
        ORDER BY j.officerId
    """)
    List<Object[]> getAllRaw(@Param("milestoneDate") LocalDateTime milestoneDate);

    @Query("""
            SELECT
                j.officerId,
                j.lastName,
                j.firstName,
                j.fullName,
                j.officerStatus,
                j.account.email,
                j.maxNumberOfLegalCase,
                SUM(CASE WHEN lc IS NOT NULL THEN 1 ELSE 0 END),
                SUM(CASE WHEN lc.legalCaseStatus = 'IN_PROCESS' THEN 1 ELSE 0 END),
                SUM(CASE WHEN lc.legalCaseStatus = 'TEMPORARY_SUSPENSION' THEN 1 ELSE 0 END),
                SUM(CASE WHEN lc.legalCaseStatus = 'OVERDUE' THEN 1 ELSE 0 END),
                SUM(CASE WHEN (lc.legalCaseStatus = 'CANCELED' OR lc.legalCaseStatus = 'EDITED') THEN 1 ELSE 0 END)
            FROM Judge j
            LEFT JOIN j.legalCases lc
            LEFT JOIN lc.batch b
            WHERE j.officerStatus = 'WORKING' AND :legalRelationshipGroup NOT MEMBER OF j.restrictedGroups AND b.storageDate >= :milestoneDate
            GROUP BY j.officerId, j.lastName, j.firstName, j.fullName,
                     j.maxNumberOfLegalCase, j.officerStatus, j.account.email
            HAVING j.maxNumberOfLegalCase < 0
                   OR SUM(CASE WHEN lc.legalCaseStatus = 'IN_PROCESS' THEN 1 ELSE 0 END) < j.maxNumberOfLegalCase
            ORDER BY
                SUM(CASE WHEN lc.legalCaseStatus = 'IN_PROCESS' THEN 1 ELSE 0 END) ASC,
                SUM(CASE WHEN lc.legalCaseStatus = 'TEMPORARY_SUSPENSION' THEN 1 ELSE 0 END) DESC,
                SUM(CASE WHEN lc.legalCaseStatus = 'OVERDUE' THEN 1 ELSE 0 END) ASC,
                SUM(CASE WHEN (lc.legalCaseStatus = 'CANCELED' OR lc.legalCaseStatus = 'EDITED') THEN 1 ELSE 0 END) ASC,
                j.firstName ASC
            """)
    List<Object[]> getAssignAssignmentRaw(@Param("milestoneDate") LocalDateTime milestoneDate, LegalRelationshipGroup legalRelationshipGroup);
}
