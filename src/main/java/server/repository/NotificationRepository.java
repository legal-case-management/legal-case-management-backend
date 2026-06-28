package server.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;
import server.entity.Account;
import server.entity.Notification;

import java.util.List;
import java.util.Optional;

public interface NotificationRepository extends JpaRepository<Notification, String> {
    @Query("""
            SELECT n FROM Notification n
            WHERE n.account = :account
            """)
    Page<Notification> getNotificationByAccount(Account account, Pageable pageable);

    Optional<Notification> findByNotificationIdAndAccount(String notificationId, Account account);

    long countByAccountAndIsReadFalse(Account account);

    @Modifying
    @Transactional
    @Query("""
            UPDATE Notification n
            SET n.isRead = true
            WHERE n.account = :account
              AND n.notificationId IN :notificationIds
            """)
    int markAsRead(
            @Param("account") Account account,
            @Param("notificationIds") List<String> notificationIds
    );

    @Modifying
    @Transactional
    @Query("""
            UPDATE Notification n
            SET n.isRead = true
            WHERE n.account = :account
              AND n.isRead = false
            """)
    int markAllAsRead(@Param("account") Account account);

    @Query("""
        SELECT MAX(CAST(SUBSTRING(tb.notificationId, 7, 6) AS int))
        FROM Notification tb
        WHERE SUBSTRING(tb.notificationId, 1, 4) = :year
          AND SUBSTRING(tb.notificationId, 5, 2) = 'TB'
    """)
    Optional<Integer> getMaxId(
            @Param("year") String year
    );
}
