package server.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import server.entity.LegalCase;

public interface LegalCaseRepository extends JpaRepository<LegalCase, String> {

}
