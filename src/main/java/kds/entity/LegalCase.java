package kds.entity;

import jakarta.persistence.*;
import kds.entity.enums.Assignment;
import kds.entity.enums.Judge;
import kds.entity.enums.StatusOfLegalCase;
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
    @Column(name = "case_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    long caseId;
    @Column(name = "reception_number")
    String receptionNumber;
    @Column(name = "reception_date", unique = true)
    LocalDate receptionDate;
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
    List<AdditionalReception> additionalReceptions;

    @OneToMany(mappedBy = "legalCase")
    List<DecisionToExtend> decisionToExtends;
}
