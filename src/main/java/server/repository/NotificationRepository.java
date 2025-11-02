package server.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import server.entity.Account;
import server.entity.LegalCase;
import server.entity.Notification;

import java.util.Optional;

public interface NotificationRepository extends JpaRepository<Notification, String> {
    @Query("""
            SELECT n FROM Notification n
            WHERE n.account = :account
            """)
    Page<Notification> getNotificationByAccount(Account account, Pageable pageable);

    Optional<Notification> findByNotificationIdAndAccount(String notificationId, Account account);
}
