package server.entity;

import jakarta.persistence.*;
import org.hibernate.annotations.Cascade;
import server.entity.enums.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(
        name = "legal_cases",
        indexes = {
                @Index(name = "idx_acceptance_number", columnList = "acceptance_number"),
                @Index(name = "idx_time", columnList = "acceptance_date")
        }
)
@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class LegalCase {
    @Id
    @Column(name = "legal_case_id", nullable = false)
    String legalCaseId;
    @Column(name = "acceptance_number", nullable = false)
    String acceptanceNumber;
    @Column(name = "acceptance_date", nullable = false)
    LocalDate acceptanceDate;
    @Column(name = "expired_date")
    LocalDate expiredDate;

    @ElementCollection
    @CollectionTable(
            name = "legal_case_litigants",
            joinColumns = @JoinColumn(name = "legal_case_id")
    )
    List<Litigant> litigants;

    @ManyToOne
    @JoinColumn(name = "legal_relationship_id", nullable = false)
    LegalRelationship legalRelationship;
    @Column(name = "storage_date", nullable = false)
    LocalDateTime storageDate;
    @Enumerated(EnumType.STRING)
    Assignment assignment;
    @Column(name = "assignment_date")
    LocalDateTime assignmentDate;
    @Enumerated(EnumType.STRING)
    @Column(name = "legal_case_status", nullable = false)
    LegalCaseStatus legalCaseStatus;

    String note;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "judge_id")
    Judge judge;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "mediator_id")
    Mediator mediator;

    @OneToMany(mappedBy = "legalCase", cascade = CascadeType.ALL, orphanRemoval = true)
    List<Decision> decisions;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "batch_id")
    Batch batch;
}
