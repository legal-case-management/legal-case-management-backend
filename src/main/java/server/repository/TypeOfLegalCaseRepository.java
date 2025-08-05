package server.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import server.entity.TypeOfLegalCase;

public interface TypeOfLegalCaseRepository extends JpaRepository<TypeOfLegalCase, String> {
    boolean existsByTypeOfLegalCaseName(String name);
}
