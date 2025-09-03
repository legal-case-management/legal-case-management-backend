package server.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import server.entity.HandleTypeOfDecision;
import server.entity.HandleTypeOfDecisionId;

public interface HandleTypeOfDecisionRepository extends JpaRepository<HandleTypeOfDecision, HandleTypeOfDecisionId> {
}
