package server.repository;

import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import server.dto.response.judge.JudgeResponse;
import server.entity.Judge;
import org.springframework.data.jpa.repository.JpaRepository;
import server.entity.enums.StatusOfOfficer;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public interface JudgeRepository extends JpaRepository<Judge, String> {
    Optional<Judge> findByAccount_AccountId(String accountId);

    @Query("""
            SELECT new server.dto.response.judge.JudgeResponse(
                j.officerId,
                j.lastName,
                j.firstName,
                j.fullName,
                j.maxNumberOfLegalCase,
                SUM(CASE WHEN lc.statusOfLegalCase = 'IN_PROCESS' THEN 1 ELSE 0 END),
                SUM(CASE WHEN lc.statusOfLegalCase = 'TEMPORARY_SUSPENSION' THEN 1 ELSE 0 END),
                SUM(CASE WHEN lc.statusOfLegalCase = 'OVERDUE' THEN 1 ELSE 0 END),
                SUM(CASE
                        WHEN (lc.statusOfLegalCase = 'CANCELED' OR lc.statusOfLegalCase = 'EDITED')
                             AND lc.acceptanceDate >= :milestoneDate
                        THEN 1 ELSE 0
                    END),
                j.statusOfOfficer,
                j.account.email
            )
            FROM Judge j
            LEFT JOIN j.legalCases lc
            WHERE (:officerId IS NULL OR j.officerId LIKE %:officerId%)
              AND (:fullName IS NULL OR j.fullName LIKE %:fullName%)
              AND (:statusOfOfficer IS NULL OR j.statusOfOfficer = :statusOfOfficer)
            GROUP BY j.officerId, j.lastName, j.firstName, j.fullName, j.maxNumberOfLegalCase, j.statusOfOfficer, j.account.email
            ORDER BY j.officerId
            """)
    List<JudgeResponse> search(String officerId, String fullName, StatusOfOfficer statusOfOfficer, @Param("milestoneDate") LocalDate milestoneDate);

    @Query("""
            SELECT new server.dto.response.judge.JudgeResponse(
                 j.officerId,
                 j.lastName,
                 j.firstName,
                 j.fullName,
                 j.maxNumberOfLegalCase,
                 SUM(CASE WHEN lc.statusOfLegalCase = 'IN_PROCESS' THEN 1 ELSE 0 END),
                 SUM(CASE WHEN lc.statusOfLegalCase = 'TEMPORARY_SUSPENSION' THEN 1 ELSE 0 END),
                 SUM(CASE WHEN lc.statusOfLegalCase = 'OVERDUE' THEN 1 ELSE 0 END),
                 SUM(CASE
                         WHEN (lc.statusOfLegalCase = 'CANCELED' OR lc.statusOfLegalCase = 'EDITED')
                              AND lc.acceptanceDate >= :milestoneDate
                         THEN 1 ELSE 0
                     END),
                 j.statusOfOfficer,
                 j.account.email
             )
             FROM Judge j
             LEFT JOIN j.legalCases lc
             GROUP BY j.officerId, j.lastName, j.firstName, j.fullName, j.maxNumberOfLegalCase, j.statusOfOfficer, j.account.email
             ORDER BY j.officerId
            """)
    List<JudgeResponse> getLimit(Pageable pageable, @Param("milestoneDate") LocalDate milestoneDate);

    @Query("""
              SELECT MAX(CAST(SUBSTRING(j.officerId, 3, 2) AS int))
              FROM Judge j
              WHERE SUBSTRING(j.officerId, 1, 2) = 'TP'
            """)
    Optional<Integer> getMaxId();

    @Query("""
            SELECT new server.dto.response.judge.JudgeResponse(
                j.officerId,
                j.lastName,
                j.firstName,
                j.fullName,
                j.maxNumberOfLegalCase,
                SUM(CASE WHEN lc.statusOfLegalCase = 'IN_PROCESS' THEN 1 ELSE 0 END),
                SUM(CASE WHEN lc.statusOfLegalCase = 'TEMPORARY_SUSPENSION' THEN 1 ELSE 0 END),
                SUM(CASE WHEN lc.statusOfLegalCase = 'OVERDUE' THEN 1 ELSE 0 END),
                SUM(CASE
                        WHEN (lc.statusOfLegalCase = 'CANCELED' OR lc.statusOfLegalCase = 'EDITED')
                             AND lc.acceptanceDate >= :milestoneDate
                        THEN 1 ELSE 0
                    END),
                j.statusOfOfficer,
                j.account.email
            )
            FROM Judge j
            LEFT JOIN j.legalCases lc
            GROUP BY j.officerId, j.lastName, j.firstName, j.fullName, j.maxNumberOfLegalCase, j.statusOfOfficer, j.account.email
            ORDER BY j.officerId
            """)
    List<JudgeResponse> getAll(@Param("milestoneDate") LocalDate milestoneDate);

    @Query("""
                SELECT new server.dto.response.judge.JudgeResponse(
                    j.officerId,
                    j.lastName,
                    j.firstName,
                    j.fullName,
                    j.maxNumberOfLegalCase,
                    SUM(CASE WHEN lc.statusOfLegalCase = 'IN_PROCESS' THEN 1 ELSE 0 END),
                    SUM(CASE WHEN lc.statusOfLegalCase = 'TEMPORARY_SUSPENSION' THEN 1 ELSE 0 END),
                    SUM(CASE WHEN lc.statusOfLegalCase = 'OVERDUE' THEN 1 ELSE 0 END),
                    SUM(CASE
                            WHEN (lc.statusOfLegalCase = 'CANCELED' OR lc.statusOfLegalCase = 'EDITED')
                                 AND lc.acceptanceDate >= :milestoneDate
                            THEN 1 ELSE 0
                        END),
                    j.statusOfOfficer,
                    j.account.email
                )
                FROM Judge j
                LEFT JOIN j.legalCases lc
                JOIN j.account a
                WHERE j.statusOfOfficer = 'WORKING'
                GROUP BY j.officerId, j.lastName, j.firstName, j.fullName, j.maxNumberOfLegalCase, j.statusOfOfficer, j.account.email
                HAVING j.maxNumberOfLegalCase < 0
                       OR SUM(CASE WHEN lc.statusOfLegalCase = 'IN_PROCESS' THEN 1 ELSE 0 END) < j.maxNumberOfLegalCase
                ORDER BY
                    SUM(CASE WHEN lc.statusOfLegalCase = 'IN_PROCESS' THEN 1 ELSE 0 END) ASC,
                    SUM(CASE WHEN lc.statusOfLegalCase = 'TEMPORARY_SUSPENSION' THEN 1 ELSE 0 END) DESC,
                    SUM(CASE WHEN lc.statusOfLegalCase = 'OVERDUE' THEN 1 ELSE 0 END) ASC,
                    SUM(CASE
                            WHEN (lc.statusOfLegalCase = 'CANCELED' OR lc.statusOfLegalCase = 'EDITED')
                                 AND lc.acceptanceDate >= :milestoneDate
                            THEN 1 ELSE 0
                        END) ASC,
                    j.fullName ASC
            """)
    List<JudgeResponse> getAssignAssignment(@Param("milestoneDate") LocalDate milestoneDate);

}
