package server.repository;

import org.mapstruct.MappingTarget;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import server.dto.request.legalRelationshipGroup.LegalRelationshipGroupRequest;
import server.entity.LegalRelationshipGroup;

import java.util.Optional;

public interface LegalRelationshipGroupRepository extends JpaRepository<LegalRelationshipGroup, String> {
    @Query("""
              SELECT MAX(CAST(SUBSTRING(lrg.legalRelationshipGroupId, 2, 2) AS int))
              FROM LegalRelationshipGroup lrg
              WHERE SUBSTRING(lrg.legalRelationshipGroupId, 1, 1) = 'N'
            """)
    Optional<Integer> getMaxLegalRelationshipGroupId();
}
