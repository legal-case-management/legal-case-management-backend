package server.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import server.entity.Decision;
import server.entity.LegalCase;

import java.util.List;

public interface DecisionRepository extends JpaRepository<Decision, String> {
    List<Decision> findDecisionByLegalCase(LegalCase legalCase);
}
