package com.qlatakv9dt.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.qlatakv9dt.entity.LegalRelationshipGroup;

import java.util.List;
import java.util.Optional;

public interface LegalRelationshipGroupRepository extends JpaRepository<LegalRelationshipGroup, String> {
    @Query("""
              SELECT MAX(CAST(SUBSTRING(lrg.legalRelationshipGroupId, 2, 2) AS int))
              FROM LegalRelationshipGroup lrg
              WHERE SUBSTRING(lrg.legalRelationshipGroupId, 1, 1) = 'N'
            """)
    Optional<Integer> getMaxId();

    @Query("""
            SELECT lrg FROM LegalRelationshipGroup lrg
            WHERE (:legalRelationshipGroupId IS NULL OR lrg.legalRelationshipGroupId ILIKE %:legalRelationshipGroupId%)
            AND (:legalRelationshipGroupName IS NULL OR lrg.legalRelationshipGroupName ILIKE %:legalRelationshipGroupName%)
            """)
    Page<LegalRelationshipGroup> search(
            String legalRelationshipGroupId,
            String legalRelationshipGroupName,
            Pageable pageable
    );

    @Query("""
            SELECT j.restrictedGroups
            FROM Judge j
            WHERE j.officerId = :officerId
            """)
    List<LegalRelationshipGroup> getRestrictedGroupsByJudgeId(String officerId);
}
