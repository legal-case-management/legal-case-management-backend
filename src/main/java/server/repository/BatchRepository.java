package server.repository;

import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import server.entity.Batch;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Repository
public interface BatchRepository extends JpaRepository<Batch, String> {
    @Query("""
              SELECT MAX(CAST(SUBSTRING(b.batchId, 6, 2) AS int))
              FROM Batch b
              WHERE SUBSTRING(b.batchId, 1, 4) = :year
              AND SUBSTRING(b.batchId, 5, 1) = 'D'
            """)
    Optional<Integer> getMaxId(
            @Param("year") String year
    );

    @Query("""
            SELECT b FROM Batch b
            ORDER BY b.batchId DESC
            """)
    List<Batch> getLimit(Pageable pageable);

    @Query("""
            SELECT b FROM Batch b
            WHERE (:batchId IS NULL OR b.batchId LIKE %:batchId%)
            AND (:batchName IS NULL OR b.batchName LIKE %:batchName%)
            AND (:note IS NULL OR b.note LIKE %:note%)
            AND (:storageDateStart IS NULL OR b.storageDate >= :storageDateStart)
            AND (:storageDateEnd IS NULL OR b.storageDate <= :storageDateEnd)
            """)
    Page<Batch> search(
            String batchId,
            String batchName,
            String note,
            LocalDateTime storageDateStart,
            LocalDateTime storageDateEnd,
            Pageable pageable
    );
}
