package com.qlatakv9dt.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.qlatakv9dt.entity.Permission;

@Repository
public interface PermissionRepository extends JpaRepository<Permission, String> {

    @Query("""
            SELECT p FROM Permission p
            WHERE (:keyword IS NULL
                   OR p.permissionId ILIKE %:keyword%
                   OR p.name ILIKE %:keyword%)
            """)
    Page<Permission> search(String keyword, Pageable pageable);
}
