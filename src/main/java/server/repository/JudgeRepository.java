package server.repository;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import reactor.util.annotation.NonNull;
import reactor.util.annotation.NonNullApi;
import server.dto.response.judge.JudgeResponse;
import server.entity.Judge;
import org.springframework.data.jpa.repository.JpaRepository;
import server.entity.enums.StatusOfJudge;

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
                 SIZE(j.legalCases),
                 j.statusOfJudge,
                 j.account.email
             ) FROM Judge j 
             WHERE (:judgeId IS NULL OR j.judgeId LIKE %:judgeId%) 
             AND (:fullName IS NULL OR j.fullName LIKE %:fullName%)
             AND (:statusOfJudge IS NULL OR j.statusOfJudge = :statusOfJudge) 
             ORDER BY j.judgeId DESC
            """)
    List<JudgeResponse> search(String judgeId, String fullName, StatusOfJudge statusOfJudge);

    @Query("""
    SELECT new server.dto.response.judge.JudgeResponse(
        j.judgeId,
        j.lastName,
        j.firstName,
        j.fullName,
        j.maxNumberOfLegalCase,
        (
            SELECT COUNT(lc)
            FROM j.legalCases lc
            WHERE lc.statusOfLegalCase = 'IN_PROCESS'
        ),
        j.statusOfJudge,
        j.account.email
    )
    FROM Judge j
    ORDER BY j.judgeId
    """)
    List<JudgeResponse> getTop50(Pageable pageable);

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
                    (
                        SELECT COUNT(lc)
                        FROM j.legalCases lc
                        WHERE lc.statusOfLegalCase = 'IN_PROCESS'
                    ),
                    j.statusOfJudge,
                    j.account.email
                )
                FROM Judge j
                ORDER BY j.judgeId
            """)
    @NonNull
    List<JudgeResponse> getAll();
}
