package server.entity;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import lombok.experimental.SuperBuilder;

import java.util.List;
import java.util.Set;

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

    @ManyToMany
    @JoinTable(
            name = "judge_restricted_groups",
            joinColumns = @JoinColumn(name = "judge_id"),
            inverseJoinColumns = @JoinColumn(name = "legal_relationship_group_id")
    )
    Set<LegalRelationshipGroup> restrictedGroups;

    @OneToMany(mappedBy = "judge")
    List<LegalCase> legalCases;
}
