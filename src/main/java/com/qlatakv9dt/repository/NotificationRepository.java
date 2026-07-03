package com.qlatakv9dt.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;
import com.qlatakv9dt.entity.Account;
import com.qlatakv9dt.entity.Notification;

import java.util.List;
import java.util.Optional;

public interface NotificationRepository extends JpaRepository<Notification, String> {
    @Query("""
            SELECT n FROM Notification n
            WHERE n.account = :account
            """)
    Page<Notification> getNotificationByAccount(Account account, Pageable pageable);

    Optional<Notification> findByNotificationIdAndAccount(String notificationId, Account account);

    long countByAccountAndReadFalse(Account account);

    @Modifying
    @Transactional
    @Query("""
            UPDATE Notification n
            SET n.read = true
            WHERE n.account = :account
              AND n.notificationId IN :notificationIds
            """)
    void markAsRead(
            @Param("account") Account account,
            @Param("notificationIds") List<String> notificationIds
    );

    @Modifying
    @Transactional
    @Query("""
            UPDATE Notification n
            SET n.read = true
            WHERE n.account = :account
              AND n.read = false
            """)
    void markAllAsRead(@Param("account") Account account);

}
