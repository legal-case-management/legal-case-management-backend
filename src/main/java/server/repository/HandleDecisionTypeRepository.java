package server.repository;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import server.entity.DecisionType;
import server.entity.HandleDecisionType;
import server.entity.HandleDecisionType.HandleDecisionTypeId;


import java.util.List;

public interface HandleDecisionTypeRepository extends JpaRepository<HandleDecisionType, HandleDecisionTypeId> {
    List<HandleDecisionType> findAllByDecisionType(DecisionType decisionType, Sort sort);
}
