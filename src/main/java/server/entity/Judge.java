package server.entity;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import lombok.experimental.SuperBuilder;
import server.entity.enums.StatusOfOfficer;

import java.util.List;

@Entity
@Table(name = "judges")
@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
@SuperBuilder
public class Judge extends Officer{
    @Column(name = "max_number_of_legal_case")
    long maxNumberOfLegalCase;

    @OneToMany(mappedBy = "judge")
    List<LegalCase> legalCases;
}
