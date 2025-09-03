package server.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import server.entity.HandleTypeOfDecision;
import server.entity.HandleTypeOfDecisionId;
import server.entity.TypeOfDecision;

import java.util.List;

public interface HandleTypeOfDecisionRepository extends JpaRepository<HandleTypeOfDecision, HandleTypeOfDecisionId> {
    List<HandleTypeOfDecision> findAllByTypeOfDecision(TypeOfDecision typeOfDecision);
}
