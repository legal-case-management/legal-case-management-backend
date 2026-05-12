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
        SELECT j
        FROM Judge j
        WHERE (:officerId IS NULL OR j.officerId LIKE %:officerId%)
          AND (:fullName IS NULL OR j.fullName LIKE %:fullName%)
          AND (:officerStatus IS NULL OR j.officerStatus = :officerStatus)
        """)
    Page<Judge> search(
            @Param("officerId") String officerId,
            @Param("fullName") String fullName,
            @Param("officerStatus") OfficerStatus officerStatus,
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
                j.fullName,
                j.officerStatus,
                j.maxWithoutMediator,
                COUNT(lc),
                SUM(CASE WHEN lrg = :legalRelationshipGroup THEN 1 ELSE 0 END)
            FROM Judge j
            LEFT JOIN j.legalCases lc ON lc.acceptanceDate BETWEEN :milestoneStartDate AND :milestoneEndDate AND lc.mediator IS NULL
            LEFT JOIN lc.legalRelationship.legalRelationshipGroup lrg
            WHERE j.officerStatus = 'WORKING'
                  AND (:legalRelationshipGroup IS NULL OR j.restrictedGroups IS EMPTY OR :legalRelationshipGroup NOT MEMBER OF j.restrictedGroups)
            GROUP BY j.officerId, j.firstName, j.lastName, j.fullName, j.maxWithoutMediator, j.officerStatus
            HAVING (j.maxWithoutMediator IS NULL OR count(lc) < j.maxWithoutMediator)
            ORDER BY j.officerId
            """)
    List<Object[]> getAssignAssignmentWithoutMediatorRaw(
            @Param("milestoneStartDate") LocalDate milestoneStartDate,
            @Param("milestoneEndDate") LocalDate milestoneEndDate,
            @Param("legalRelationshipGroup") LegalRelationshipGroup legalRelationshipGroup
    );

    @Query("""
            SELECT
                j.officerId,
                j.fullName,
                j.officerStatus,
                j.maxWithMediator,
                COUNT(lc),
                COUNT(lc)
            FROM Judge j
            LEFT JOIN j.legalCases lc ON lc.acceptanceDate BETWEEN :milestoneStartDate AND :milestoneEndDate AND lc.mediator IS NOT NULL
            WHERE j.officerStatus = 'WORKING'
                  AND (:legalRelationshipGroup IS NULL OR j.restrictedGroups IS EMPTY OR :legalRelationshipGroup NOT MEMBER OF j.restrictedGroups)
            GROUP BY j.officerId, j.firstName, j.lastName, j.fullName, j.maxWithMediator, j.officerStatus
            HAVING (j.maxWithMediator IS NULL OR count(lc) < j.maxWithMediator)
            ORDER BY j.officerId
            """)
    List<Object[]> getAssignAssignmentWithMediatorRaw(
            @Param("milestoneStartDate") LocalDate milestoneStartDate,
            @Param("milestoneEndDate") LocalDate milestoneEndDate
    );


    @Query("""
            SELECT COUNT(j) > 0
            FROM Judge j
            LEFT JOIN j.legalCases lc ON lc.acceptanceDate BETWEEN :milestoneStartDate AND :milestoneEndDate AND lc.mediator IS NULL
            WHERE j.officerId = :officerId
                  AND j.officerStatus = 'WORKING'
                  AND (j.restrictedGroups IS EMPTY OR :legalRelationshipGroup NOT MEMBER OF j.restrictedGroups)
            GROUP BY j.officerId
            HAVING j.maxWithoutMediator IS NULL OR COUNT(*) < j.maxWithoutMediator
            """)
    boolean isAvailableAssignmentWithoutMediator(
            @Param("milestoneStartDate") LocalDate milestoneStartDate,
            @Param("milestoneEndDate") LocalDate milestoneEndDate,
            @Param("legalRelationshipGroup") LegalRelationshipGroup legalRelationshipGroup,
            @Param("officerId") String officerId
    );

    @Query("""
            SELECT COUNT(j) > 0
            FROM Judge j
            LEFT JOIN j.legalCases lc ON lc.acceptanceDate BETWEEN :milestoneStartDate AND :milestoneEndDate AND lc.mediator IS NOT NULL
            WHERE j.officerId = :officerId
                  AND j.officerStatus = 'WORKING'
            GROUP BY j.officerId
            HAVING j.maxWithoutMediator IS NULL OR COUNT(*) < j.maxWithoutMediator
            """)
    boolean isAvailableAssignmentWithMediator(
            @Param("milestoneStartDate") LocalDate milestoneStartDate,
            @Param("milestoneEndDate") LocalDate milestoneEndDate,
            @Param("officerId") String officerId
    );

    @Query("""
        SELECT
            COUNT(lc)
        FROM Judge j
        LEFT JOIN j.legalCases lc
        WHERE j.officerId = :officerId
              AND lc.legalRelationship.legalRelationshipGroup.legalRelationshipGroupId = 'N04'
              AND lc.acceptanceDate >= :milestoneDate
    """)
    long getNumberOfLandCasesByJudge(
            @Param("officerId") String officerId,
            @Param("milestoneDate") LocalDate milestoneDate
    );
}
