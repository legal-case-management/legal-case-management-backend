package server.repository;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import server.entity.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import server.entity.LegalCase;

import java.util.List;
import java.util.Optional;

@Repository
public interface AccountRepository extends JpaRepository<Account, String> {
    Optional<Account> findAccountByUsername(String username);
    Optional<Account> findAccountByEmail(String email);
    Optional<Account> findAccountByAccountId(String accountId);
    boolean existsByUsername(String username);
    boolean existsByEmail(String email);

    @Query("""
            SELECT a FROM Account a
            LEFT JOIN a.officer o
            ORDER BY a.accountId DESC
            """)
    List<Account> getLimit(Pageable pageable);
}
