package server.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import server.entity.Decision;

public interface DecisionRepository extends JpaRepository<Decision, String> {

}
