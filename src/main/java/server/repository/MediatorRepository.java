package server.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import server.dto.response.mediator.MediatorResponse;
import server.entity.Mediator;
import server.entity.enums.OfficerStatus;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

public interface MediatorRepository extends JpaRepository<Mediator, String> {

    @Query("""
        SELECT m
        FROM Mediator m
        WHERE (:officerId IS NULL OR m.officerId LIKE %:officerId%)
          AND (:fullName IS NULL OR m.fullName LIKE %:fullName%)
          AND (:statusOfOfficer IS NULL OR m.officerStatus = :statusOfOfficer)
        ORDER BY m.officerId
    """)
    Page<Mediator> search(
            @Param("officerId") String officerId,
            @Param("fullName") String fullName,
            @Param("statusOfOfficer") OfficerStatus statusOfOfficer,
            Pageable pageable
    );

    @Query("""
              SELECT MAX(CAST(SUBSTRING(m.officerId, 3, 2) AS int))
              FROM Mediator m
              WHERE SUBSTRING(m.officerId, 1, 2) = 'HG'
            """)
    Optional<Integer> getMaxId();
}
