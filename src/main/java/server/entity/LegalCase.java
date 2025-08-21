package server.entity;

import jakarta.persistence.*;
import server.entity.enums.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.List;

@Entity
@Table(
        name = "legal_cases",
        indexes = {
                @Index(name = "idx_acceptance_number", columnList = "acceptance_number"),
                @Index(name = "idx_time", columnList = "acceptance_date, acceptance_number")
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
    @Column(nullable = false)
    String plaintiff;
    @Column(name = "plaintiff_address")
    String plaintiffAddress;
    String defendant;
    @Column(name = "defendant_address")
    String defendantAddress;
    @ManyToOne
    @JoinColumn(name = "legal_relationship_id", nullable = false)
    LegalRelationship legalRelationship;
    @Column(name = "storage_date", nullable = false)
    LocalDateTime storageDate;
    Assignment assignment;
    @Column(name = "assignment_date")
    LocalDateTime assignmentDate;
    @Enumerated(EnumType.STRING)
    @Column(name = "status_of_legal_case", nullable = false)
    StatusOfLegalCase statusOfLegalCase;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "judge_id")
    Judge judge;

    @OneToMany(mappedBy = "legalCase")
    List<Decision> decisions;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "batch_id")
    Batch batch;

    public boolean isExpired() {
        return expiredDate != null && expiredDate.isBefore(LocalDate.now());
    }

    public long getDaysUntilExpired() {
        if (expiredDate == null) {
            return -1;
        }
        return ChronoUnit.DAYS.between(LocalDate.now(), expiredDate);
    }
}
