package server.entity;

import jakarta.persistence.*;
import server.entity.enums.Assignment;
import server.entity.enums.StatusOfLegalCase;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDate;
import java.util.List;

@Entity
@Table(name = "legal_cases")
@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class LegalCase {
    @Id
    @Column(name = "legal_case_id")
    @GeneratedValue(strategy = GenerationType.UUID)
    String legalCaseId;
    @Column(name = "acceptance_number", unique = true)
    String acceptanceNumber;
    @Column(name = "acceptance_date")
    LocalDate acceptanceDate;
    @Column(name = "expired_date")
    LocalDate expiredDate;
    String plaintiff;
    String defendant;
    @Column(name = "legal_relationship")
    String legalRelationship;
    @Column(name = "type_of_legal_case")
    String typeOfLegalCase;
    @Enumerated(EnumType.STRING)
    Assignment assignment;
    @Enumerated(EnumType.STRING)
    @Column(name = "status_of_legal_case")
    StatusOfLegalCase statusOfLegalCase;

    @ManyToOne
    @JoinColumn(name = "judge_id")
    Judge judge;

    @OneToMany(mappedBy = "legalCase")
    List<AdditionalAcceptanceNotice> additionalAcceptanceNotices;

    @OneToMany(mappedBy = "legalCase")
    List<ExtendDecision> extendDecisions;
}
