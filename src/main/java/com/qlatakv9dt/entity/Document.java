package com.qlatakv9dt.entity;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "documents")
@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class Document {
    @Id
    @Column(name = "document_id", nullable = false)
    String documentId;

    @Column(name = "document_number", nullable = false)
    String documentNumber;

    @Column(name = "release_date", nullable = false)
    LocalDate releaseDate;

    @Column(name = "storage_date", nullable = false)
    LocalDateTime storageDate;

    @ManyToOne
    @JoinColumn(name = "document_type_id", nullable = false)
    DocumentType documentType;
    String note;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "legal_case_id")
    LegalCase legalCase;
}
