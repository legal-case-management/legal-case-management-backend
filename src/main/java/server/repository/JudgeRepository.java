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

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

public interface JudgeRepository extends JpaRepository<Judge, String> {
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
                ON lc.batch.storageDate >= :milestoneDateTime
            LEFT JOIN lc.batch b
                ON b.storageDate >= :milestoneDateTime
            WHERE (:officerId IS NULL OR j.officerId LIKE %:officerId%)
                  AND (:fullName IS NULL OR j.fullName LIKE %:fullName%)
                  AND (:officerStatus IS NULL OR j.officerStatus = :officerStatus)
            GROUP BY j.officerId, j.lastName, j.firstName, j.fullName,
                     j.maxNumberOfLegalCase, j.officerStatus, j.account.email
            """)
    Page<Object[]> search(
            @Param("officerId") String officerId,
            @Param("fullName") String fullName,
            @Param("officerStatus") OfficerStatus officerStatus,
            @Param("milestoneDateTime") LocalDateTime milestoneDateTime,
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
                j.maxNumberOfLegalCase,
                SUM(CASE WHEN lc IS NOT NULL THEN 1 ELSE 0 END) AS totalCases,
                SUM(
                    CASE
                        WHEN lc.legalRelationship.legalRelationshipGroup.legalRelationshipGroupId = 'N04'
                             AND lc.acceptanceDate >= :milestoneDate
                        THEN 1 ELSE 0
                    END
                )
            FROM Judge j
            LEFT JOIN j.legalCases lc
                   ON lc.batch.storageDate >= :milestoneDateTime
            LEFT JOIN lc.batch b
            WHERE j.officerStatus = 'WORKING'
                  AND (j.restrictedGroups IS EMPTY OR :legalRelationshipGroup NOT MEMBER OF j.restrictedGroups)
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
    List<Object[]> getAssignAssignmentRaw(
            @Param("milestoneDateTime") LocalDateTime milestoneDateTime,
            @Param("milestoneDate") LocalDate milestoneDate,
            @Param("legalRelationshipGroup") LegalRelationshipGroup legalRelationshipGroup
    );

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
                       ON lc.batch.storageDate >= :milestoneDateTime
                LEFT JOIN lc.batch b
                WHERE j.officerStatus = 'WORKING'
                      AND (j.restrictedGroups IS EMPTY OR :legalRelationshipGroup NOT MEMBER OF j.restrictedGroups)
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
    List<Object[]> getAssignAssignmentRaw(
            @Param("milestoneDateTime") LocalDateTime milestoneDateTime,
            @Param("legalRelationshipGroup") LegalRelationshipGroup legalRelationshipGroup
    );
}
