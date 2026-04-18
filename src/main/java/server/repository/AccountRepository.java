package server.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import server.entity.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import server.entity.enums.Role;

import java.util.Optional;

@Repository
public interface AccountRepository extends JpaRepository<Account, String> {
    Optional<Account> findAccountByUsername(String username);
    Optional<Account> findAccountByEmail(String email);
    Optional<Account> findAccountByOfficerOfficerId(String officerId);

    boolean existsByUsername(String username);
    boolean existsByEmail(String email);

    @Query("""
            SELECT a FROM Account a
            LEFT JOIN FETCH a.officer o
            WHERE (:username IS NULL OR a.username = :username)
              AND (:email IS NULL OR a.email = :email)
              AND (:role IS NULL OR a.role = :role)
              AND (:fullName IS NULL OR o.fullName LIKE %:fullName%)
            """)
    Page<Account> search(
            String username,
            String email,
            Role role,
            String fullName,
            Pageable pageable
    );
}
