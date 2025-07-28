package server.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import server.entity.LegalCase;
import server.entity.enums.TypeOfLegalCase;

import java.time.LocalDate;
import java.util.List;

public interface LegalCaseRepository extends JpaRepository<LegalCase, String> {
    boolean existsByCaseNumber(String caseNumber);

    @Query("SELECT lc FROM LegalCase lc " +
            "JOIN lc.judge j " +
            "WHERE (:acceptanceNumber IS NULL OR lc.acceptanceNumber LIKE %:acceptanceNumber%) " +
            "AND (:startAcceptanceDate IS NULL OR lc.acceptanceDate >= :startAcceptanceDate) " +
            "AND (:endAcceptanceDate IS NULL OR lc.acceptanceDate <= :endAcceptanceDate) " +
            "AND (:plaintiff IS NULL OR lc.plaintiff LIKE %:plaintiff%) " +
            "AND (:defendant IS NULL OR lc.defendant LIKE %:defendant%) " +
            "AND (:typeOfLegalCase IS NULL OR lc.typeOfLegalCase = :typeOfLegalCase) " +
            "AND (:judgeName IS NULL OR (j IS NOT NULL AND j.fullName LIKE %:judgeName%))")
    List<LegalCase> searchLegalCases(
            String acceptanceNumber,
            LocalDate startAcceptanceDate,
            LocalDate endAcceptanceDate,
            String plaintiff,
            String defendant,
            TypeOfLegalCase typeOfLegalCase,
            String judgeName
    );
}
