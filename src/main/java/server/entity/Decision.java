package server.entity;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import server.entity.enums.TypeOfDecision;

import java.time.LocalDate;

@Entity
@Table(name = "decisions")
@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class Decision {
    @Id
    @Column(name = "decision_id")
    String extendDecisionId;
    @Column(name = "acceptance_number", unique = true)
    String acceptanceNumber;
    @Column(name = "acceptance_date")
    LocalDate acceptanceDate;
    @Column(name = "type_of_decision")
    @Enumerated(EnumType.STRING)
    TypeOfDecision typeOfDecision;

    @ManyToOne
    @JoinColumn(name = "legal_case_id")
    LegalCase legalCase;
}
