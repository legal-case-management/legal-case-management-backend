package server.entity;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Entity
@Table(name = "legal_relationships")
@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class LegalRelationship {
    @Id
    @Column(name = "legal_relationship_id", nullable = false)
    String legalRelationshipId;
    @Column(name = "legal_relationship_name", nullable = false, length = 500)
    String legalRelationshipName;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "type_of_legal_case_id", nullable = false)
    TypeOfLegalCase typeOfLegalCase;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "legal_relationship_group_id", nullable = false)
    LegalRelationshipGroup legalRelationshipGroup;

    @OneToMany(mappedBy = "legalRelationship")
    List<LegalCase> legalCases;
}
