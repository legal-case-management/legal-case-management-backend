package server.entity;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import server.entity.enums.CourtIssued;

import java.util.List;

@Entity
@Table(name = "type_of_decisions")
@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class TypeOfDecision {
    @Id
    @Column(name = "type_of_decision_id")
    String typeOfDecisionId;
    @Column(name = "type_of_decision_name", nullable = false, length = 500)
    String typeOfDecisionName;
    @Column(name = "court_issued", nullable = false)
    @Enumerated(EnumType.STRING)
    CourtIssued courtIssued;
    @Column(name = "the_end_decision", nullable = false)
    boolean theEndDecision;

    @ManyToOne
    @JoinColumn(name = "type_of_legal_case_id", nullable = false)
    TypeOfLegalCase typeOfLegalCase;

    @OneToMany(mappedBy = "typeOfDecision")
    List<HandleTypeOfDecision> handleTypeOfDecisions;

    @OneToMany(mappedBy = "typeOfDecision")
    List<Decision> decisions;
}
