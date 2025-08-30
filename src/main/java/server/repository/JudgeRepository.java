package server.repository;

import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import reactor.util.annotation.NonNull;
import reactor.util.annotation.NonNullApi;
import server.dto.response.judge.JudgeResponse;
import server.entity.Judge;
import org.springframework.data.jpa.repository.JpaRepository;
import server.entity.enums.StatusOfJudge;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public interface JudgeRepository extends JpaRepository<Judge, String> {
    Optional<Judge> findByAccount_AccountId(String accountId);

    @Query("""
            SELECT new server.dto.response.judge.JudgeResponse(
                j.judgeId,
                j.lastName,
                j.firstName,
                j.fullName,
                j.maxNumberOfLegalCase,
                SUM(CASE WHEN lc.statusOfLegalCase = 'IN_PROCESS' THEN 1 ELSE 0 END),
                SUM(CASE WHEN lc.statusOfLegalCase = 'TEMPORARY_SUSPENSION' THEN 1 ELSE 0 END),
                SUM(CASE WHEN lc.statusOfLegalCase = 'OVERDUE' THEN 1 ELSE 0 END),
                SUM(CASE
                        WHEN (lc.statusOfLegalCase = 'CANCELED' OR lc.statusOfLegalCase = 'EDITED')
                             AND lc.acceptanceDate >= :oneYearAgo
                        THEN 1 ELSE 0
                    END),
                j.statusOfJudge,
                j.account.email
            )
            FROM Judge j
            LEFT JOIN j.legalCases lc
            WHERE (:judgeId IS NULL OR j.judgeId LIKE %:judgeId%)
              AND (:fullName IS NULL OR j.fullName LIKE %:fullName%)
              AND (:statusOfJudge IS NULL OR j.statusOfJudge = :statusOfJudge)
            GROUP BY j.judgeId, j.lastName, j.firstName, j.fullName, j.maxNumberOfLegalCase, j.statusOfJudge, j.account.email
            ORDER BY j.judgeId
            """)
    List<JudgeResponse> search(String judgeId, String fullName, StatusOfJudge statusOfJudge, @Param("oneYearAgo") LocalDate oneYearAgo);

    @Query("""
            SELECT new server.dto.response.judge.JudgeResponse(
                 j.judgeId,
                 j.lastName,
                 j.firstName,
                 j.fullName,
                 j.maxNumberOfLegalCase,
                 SUM(CASE WHEN lc.statusOfLegalCase = 'IN_PROCESS' THEN 1 ELSE 0 END),
                 SUM(CASE WHEN lc.statusOfLegalCase = 'TEMPORARY_SUSPENSION' THEN 1 ELSE 0 END),
                 SUM(CASE WHEN lc.statusOfLegalCase = 'OVERDUE' THEN 1 ELSE 0 END),
                 SUM(CASE
                         WHEN (lc.statusOfLegalCase = 'CANCELED' OR lc.statusOfLegalCase = 'EDITED')
                              AND lc.acceptanceDate >= :oneYearAgo
                         THEN 1 ELSE 0
                     END),
                 j.statusOfJudge,
                 j.account.email
             )
             FROM Judge j
             LEFT JOIN j.legalCases lc
             GROUP BY j.judgeId, j.lastName, j.firstName, j.fullName, j.maxNumberOfLegalCase, j.statusOfJudge, j.account.email
             ORDER BY j.judgeId
            """)
    List<JudgeResponse> getTop50(Pageable pageable, @Param("oneYearAgo") LocalDate oneYearAgo);

    @Query("""
              SELECT MAX(CAST(SUBSTRING(j.judgeId, 3, 2) AS int))
              FROM Judge j
              WHERE SUBSTRING(j.judgeId, 1, 2) = 'TP'
            """)
    Optional<Integer> getMaxId();

    @Query("""
            SELECT new server.dto.response.judge.JudgeResponse(
                j.judgeId,
                j.lastName,
                j.firstName,
                j.fullName,
                j.maxNumberOfLegalCase,
                SUM(CASE WHEN lc.statusOfLegalCase = 'IN_PROCESS' THEN 1 ELSE 0 END),
                SUM(CASE WHEN lc.statusOfLegalCase = 'TEMPORARY_SUSPENSION' THEN 1 ELSE 0 END),
                SUM(CASE WHEN lc.statusOfLegalCase = 'OVERDUE' THEN 1 ELSE 0 END),
                SUM(CASE
                        WHEN (lc.statusOfLegalCase = 'CANCELED' OR lc.statusOfLegalCase = 'EDITED')
                             AND lc.acceptanceDate >= :oneYearAgo
                        THEN 1 ELSE 0
                    END),
                j.statusOfJudge,
                j.account.email
            )
            FROM Judge j
            LEFT JOIN j.legalCases lc
            GROUP BY j.judgeId, j.lastName, j.firstName, j.fullName, j.maxNumberOfLegalCase, j.statusOfJudge, j.account.email
            ORDER BY j.judgeId
            """)
    List<JudgeResponse> getAll(@Param("oneYearAgo") LocalDate oneYearAgo);

    @Query("""
                SELECT new server.dto.response.judge.JudgeResponse(
                    j.judgeId,
                    j.lastName,
                    j.firstName,
                    j.fullName,
                    j.maxNumberOfLegalCase,
                    SUM(CASE WHEN lc.statusOfLegalCase = 'IN_PROCESS' THEN 1 ELSE 0 END),
                    SUM(CASE WHEN lc.statusOfLegalCase = 'TEMPORARY_SUSPENSION' THEN 1 ELSE 0 END),
                    SUM(CASE WHEN lc.statusOfLegalCase = 'OVERDUE' THEN 1 ELSE 0 END),
                    SUM(CASE
                            WHEN (lc.statusOfLegalCase = 'CANCELED' OR lc.statusOfLegalCase = 'EDITED')
                                 AND lc.acceptanceDate >= :oneYearAgo
                            THEN 1 ELSE 0
                        END),
                    j.statusOfJudge,
                    j.account.email
                )
                FROM Judge j
                LEFT JOIN j.legalCases lc
                WHERE j.statusOfJudge = 'WORKING' AND (j.maxNumberOfLegalCase IS NULL OR
                      SUM(CASE WHEN lc.statusOfLegalCase = 'IN_PROCESS' THEN 1 ELSE 0 END) < j.maxNumberOfLegalCase)
                GROUP BY j.judgeId, j.lastName, j.firstName, j.fullName, j.maxNumberOfLegalCase, j.statusOfJudge, j.account.email
                ORDER BY
                    SUM(CASE WHEN lc.statusOfLegalCase = 'IN_PROCESS' THEN 1 ELSE 0 END) ASC,
                    SUM(CASE WHEN lc.statusOfLegalCase = 'TEMPORARY_SUSPENSION' THEN 1 ELSE 0 END) DESC,
                    SUM(CASE WHEN lc.statusOfLegalCase = 'OVERDUE' THEN 1 ELSE 0 END) ASC,
                    SUM(CASE
                            WHEN (lc.statusOfLegalCase = 'CANCELED' OR lc.statusOfLegalCase = 'EDITED')
                                 AND lc.acceptanceDate >= :oneYearAgo
                            THEN 1 ELSE 0
                        END) ASC,
                    j.fullName ASC
            """)
    List<JudgeResponse> getAssignAssignment(@Param("oneYearAgo") LocalDate oneYearAgo);

}
