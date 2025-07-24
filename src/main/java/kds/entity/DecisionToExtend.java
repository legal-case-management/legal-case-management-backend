package kds.entity;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDate;

@Entity
@Table(name = "decision_to_extends")
@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class DecisionToExtend {
    @Id
    @Column(name = "decision_to_extend_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    long decisionToExtendId;
    @Column(name = "decision_number", unique = true)
    String decisionNumber;
    @Column(name = "decision_date")
    LocalDate decisionDate;

    @ManyToOne
    @JoinColumn(name = "legal_case_id")
    LegalCase legalCase;
}
