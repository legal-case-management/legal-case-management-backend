package server.entity;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDate;

@Entity
@Table(name = "extend_decisions")
@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class ExtendDecision {
    @Id
    @Column(name = "extend_decision_id")
    @GeneratedValue(strategy = GenerationType.UUID)
    String extendDecisionId;
    @Column(name = "acceptance_number", unique = true)
    String acceptanceNumber;
    @Column(name = "acceptance_date")
    LocalDate acceptanceDate;

    @ManyToOne
    @JoinColumn(name = "legal_case_id")
    LegalCase legalCase;
}
