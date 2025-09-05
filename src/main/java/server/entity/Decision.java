package server.entity;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

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
    @Column(name = "decision_id", nullable = false)
    String decisionId;
    @Column(name = "number")
    String number;
    @Column(name = "release_date", nullable = false)
    LocalDate releaseDate;
    @Column(name = "added_date", nullable = false)
    LocalDate addedDate;
    @ManyToOne
    @JoinColumn(name = "type_of_decision_id", nullable = false)
    TypeOfDecision typeOfDecision;
    String note;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "legal_case_id")
    LegalCase legalCase;
}
