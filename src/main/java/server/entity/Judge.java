package server.entity;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import server.entity.enums.StatusOfJudge;

import java.util.List;

@Entity
@Table(name = "judges")
@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class Judge {
    @Id
    @Column(name = "judge_id")
    @GeneratedValue(strategy = GenerationType.UUID)
    String judgeId;
    @Column(name = "first_name")
    String firstName;
    @Column(name = "last_name")
    String lastName;
    @Column(name = "full_name", insertable = false, updatable = false)
    String fullName;
    @Column(name = "max_number_of_legal_case")
    long maxNumberOfLegalCase;

    @Enumerated(EnumType.STRING)
    StatusOfJudge statusOfJudge;

    @OneToMany(mappedBy = "judge")
    List<LegalCase> legalCases;
    @OneToOne(mappedBy = "judge")
    Account account;

    private String getName() {
        return lastName + " " + firstName;
    }
}
