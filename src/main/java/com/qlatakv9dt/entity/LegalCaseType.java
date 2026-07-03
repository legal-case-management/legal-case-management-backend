package com.qlatakv9dt.entity;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Entity
@Table(name = "legal_case_types")
@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class LegalCaseType {
    @Id
    @Column(name = "legal_case_type_id", nullable = false)
    String legalCaseTypeId;

    @Column(name = "legal_case_type_name", nullable = false, unique = true)
    String legalCaseTypeName;

    @Column(name = "code_name", nullable = false, unique = true)
    String codeName;

    @OneToMany(mappedBy = "legalCaseType")
    List<LegalRelationship> legalRelationships;

    @OneToMany(mappedBy = "legalCaseType", fetch = FetchType.LAZY)
    List<DocumentType> typeOfDecisions;
}
