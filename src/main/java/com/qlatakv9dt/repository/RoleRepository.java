package com.qlatakv9dt.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.qlatakv9dt.entity.Role;

@Repository
public interface RoleRepository extends JpaRepository<Role, String> {

    @Query("""
            SELECT r FROM Role r
            WHERE (:keyword IS NULL
                   OR r.roleId ILIKE %:keyword%
                   OR r.name ILIKE %:keyword%)
            """)
    Page<Role> search(String keyword, Pageable pageable);
}
