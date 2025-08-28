package server.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import server.entity.Batch;

@Repository
public interface BatchRepository extends JpaRepository<Batch, String> {

}
