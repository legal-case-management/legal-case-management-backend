package server.entity;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import server.entity.enums.CourtIssued;

import java.util.List;

@Entity
@Table(name = "decision_types")
@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class DecisionType {
    @Id
    @Column(name = "decision_type_id")
    String decisionTypeId;
    @Column(name = "decision_type_name", nullable = false, length = 500)
    String decisionTypeName;
    @Column(name = "court_issued", nullable = false)
    @Enumerated(EnumType.STRING)
    CourtIssued courtIssued;
    @Column(name = "the_end_decision", nullable = false)
    boolean theEndDecision;

    @ManyToOne
    @JoinColumn(name = "legal_case_type_id", nullable = false)
    LegalCaseType legalCaseType;

    @OneToMany(mappedBy = "decisionType")
    List<HandleDecisionType> handleTypeOfDecisions;

    @OneToMany(mappedBy = "decisionType")
    List<Decision> decisions;
}
