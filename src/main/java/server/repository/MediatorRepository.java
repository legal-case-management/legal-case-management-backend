package server.repository;

import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import server.dto.response.judge.JudgeResponse;
import server.dto.response.mediator.MediatorResponse;
import server.entity.Mediator;
import server.entity.enums.StatusOfOfficer;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public interface MediatorRepository extends JpaRepository<Mediator, String> {
    Optional<Mediator> findByAccount_AccountId(String accountId);
    @Query("""
            SELECT new server.dto.response.mediator.MediatorResponse(
                m.officerId,
                m.lastName,
                m.firstName,
                m.fullName,
                m.statusOfOfficer,
                m.account.email,
                SUM(CASE WHEN lc.statusOfLegalCase = 'IN_PROCESS' THEN 1 ELSE 0 END)
            )
            FROM Mediator m
            LEFT JOIN m.legalCases lc
            WHERE (:officerId IS NULL OR m.officerId LIKE %:officerId%)
              AND (:fullName IS NULL OR m.fullName LIKE %:fullName%)
              AND (:statusOfOfficer IS NULL OR m.statusOfOfficer = :statusOfOfficer)
            GROUP BY m.officerId, m.lastName, m.firstName, m.fullName, m.statusOfOfficer, m.account.email
            ORDER BY m.officerId
            """)
    Page<MediatorResponse> search(
            String officerId, 
            String fullName, 
            StatusOfOfficer statusOfOfficer,
            Pageable pageable
    );

    @Query("""
            SELECT new server.dto.response.mediator.MediatorResponse(
                m.officerId,
                m.lastName,
                m.firstName,
                m.fullName,
                m.statusOfOfficer,
                m.account.email,
                SUM(CASE WHEN lc.statusOfLegalCase = 'IN_PROCESS' THEN 1 ELSE 0 END)
            )
             FROM Mediator m
             LEFT JOIN m.legalCases lc
             GROUP BY m.officerId, m.lastName, m.firstName, m.fullName, m.statusOfOfficer, m.account.email
             ORDER BY m.officerId
            """)
    List<MediatorResponse> getLimit(Pageable pageable);

    @Query("""
            SELECT new server.dto.response.mediator.MediatorResponse(
                m.officerId,
                m.lastName,
                m.firstName,
                m.fullName,
                m.statusOfOfficer,
                m.account.email,
                SUM(CASE WHEN lc.statusOfLegalCase = 'IN_PROCESS' THEN 1 ELSE 0 END)
            )
             FROM Mediator m
             LEFT JOIN m.legalCases lc
             GROUP BY m.officerId, m.lastName, m.firstName, m.fullName, m.statusOfOfficer, m.account.email
             ORDER BY m.officerId
            """)
    List<MediatorResponse> getAll();

    @Query("""
              SELECT MAX(CAST(SUBSTRING(m.officerId, 3, 2) AS int))
              FROM Mediator m
              WHERE SUBSTRING(m.officerId, 1, 2) = 'HG'
            """)
    Optional<Integer> getMaxId();
}
