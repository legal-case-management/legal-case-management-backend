package kds.entity.enums;

import jakarta.persistence.*;
import kds.entity.Account;
import kds.entity.LegalCase;
import lombok.*;
import lombok.experimental.FieldDefaults;

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
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    long judgeId;
    @Column(name = "fist_name")
    String fistName;
    @Column(name = "last_name")
    String lastName;
    @Column(name = "max_number_of_legal_case")
    long maxNumberOfLegalCase;

    @OneToMany(mappedBy = "judge")
    List<LegalCase> legalCases;
    @OneToOne(mappedBy = "judge")
    Account account;
}
