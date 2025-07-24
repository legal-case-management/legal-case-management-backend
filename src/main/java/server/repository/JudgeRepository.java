package server.repository;

import server.entity.enums.Judge;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface JudgeRepository extends JpaRepository<Judge, String> {
    Optional<Judge> findByAccount_AccountId(String accountId);
}
