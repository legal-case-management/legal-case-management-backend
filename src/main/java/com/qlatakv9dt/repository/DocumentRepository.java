package com.qlatakv9dt.repository;

import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.qlatakv9dt.entity.Document;
import com.qlatakv9dt.entity.LegalCase;

import java.util.List;
import java.util.Optional;

public interface DocumentRepository extends JpaRepository<Document, String> {
    List<Document> findAllByLegalCase(LegalCase legalCase, Sort sort);

    @Query("""
            SELECT MAX(CAST(SUBSTRING(d.documentId, 14, 2) AS int))
            FROM Document d
            WHERE SUBSTRING(d.documentId, 1, 11) = :legalCaseId
            AND SUBSTRING(d.documentId, 12, 2) = 'TL'
            """)
    Optional<Integer> getMaxId(
            @Param("legalCaseId") String legalCaseId
    );
}
