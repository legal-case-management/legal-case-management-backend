package server.repository;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import server.entity.Judge;
import org.springframework.data.jpa.repository.JpaRepository;
import server.entity.enums.StatusOfJudge;

import java.util.List;
import java.util.Optional;

public interface JudgeRepository extends JpaRepository<Judge, String> {
    Optional<Judge> findByAccount_AccountId(String accountId);

    @Query("""
            SELECT j FROM Judge j 
                        WHERE (:judgeId IS NULL OR j.judgeId LIKE %:judgeId%) 
                        AND (:fullName IS NULL OR j.fullName LIKE %:fullName%)
                        AND (:statusOfJudge IS NULL OR j.statusOfJudge = :statusOfJudge) 
                        ORDER BY j.judgeId DESC
            """)
    List<Judge> searchJudge(
            String judgeId,
            String fullName,
            StatusOfJudge statusOfJudge
    );

    @Query("SELECT j FROM Judge j ORDER BY j.judgeId DESC")
    List<Judge> get50Judge(Pageable pageable);

    @Query("""
              SELECT MAX(CAST(SUBSTRING(j.judgeId, 3, 2) AS int))
              FROM Judge j
              WHERE SUBSTRING(j.judgeId, 1, 2) = 'TP'
            """)
    Optional<Integer> getMaxJudgeId();
}
