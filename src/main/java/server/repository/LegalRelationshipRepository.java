package server.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import server.entity.LegalRelationship;

public interface LegalRelationshipRepository extends JpaRepository<LegalRelationship, String> {

}
