package server.repository;

import org.mapstruct.MappingTarget;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import server.dto.request.legalRelationshipGroup.LegalRelationshipGroupRequest;
import server.entity.LegalCase;
import server.entity.LegalRelationshipGroup;
import server.entity.enums.StatusOfLegalCase;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public interface LegalRelationshipGroupRepository extends JpaRepository<LegalRelationshipGroup, String> {
    @Query("""
              SELECT MAX(CAST(SUBSTRING(lrg.legalRelationshipGroupId, 2, 2) AS int))
              FROM LegalRelationshipGroup lrg
              WHERE SUBSTRING(lrg.legalRelationshipGroupId, 1, 1) = 'N'
            """)
    Optional<Integer> getMaxLegalRelationshipGroupId();

    @Query("SELECT lrg FROM LegalRelationshipGroup lrg ORDER BY lrg.legalRelationshipGroupId DESC")
    List<LegalRelationshipGroup> getTop50LegalRelationshipGroups(Pageable pageable);

    @Query("""
            SELECT lrg FROM LegalRelationshipGroup lrg
            WHERE (:legalRelationshipGroupId IS NULL OR lrg.legalRelationshipGroupId LIKE %:legalRelationshipGroupId%)
            AND (:legalRelationshipGroupName IS NULL OR lrg.legalRelationshipGroupName LIKE %:legalRelationshipGroupName%)
            """)
    List<LegalRelationshipGroup> search(
            String legalRelationshipGroupId,
            String legalRelationshipGroupName
    );
}
