package server.entity;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import server.entity.enums.LegalCaseStatus;

import java.util.List;
import java.util.Set;

@Entity
@Table(name = "document_types")
@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class DocumentType {
    @Id
    @Column(name = "document_type_id")
    String documentTypeId;
    @Column(name = "document_type_name", nullable = false, length = 500)
    String documentTypeName;

    @ElementCollection(targetClass = LegalCaseStatus.class)
    @Enumerated(EnumType.STRING)
    @CollectionTable(name = "document_type_pre_statuses", joinColumns = @JoinColumn(name = "document_type_id"))
    @Column(name = "pre_status")
    Set<LegalCaseStatus> preStatuses;

    @Enumerated(EnumType.STRING)
    @Column(name = "post_status")
    LegalCaseStatus postStatus;

    @Column(name = "extension_period", nullable = false)
    int extensionPeriod;

    @ManyToOne
    @JoinColumn(name = "legal_case_type_id", nullable = false)
    LegalCaseType legalCaseType;

    @OneToMany(mappedBy = "documentType")
    List<Document> documents;
}
