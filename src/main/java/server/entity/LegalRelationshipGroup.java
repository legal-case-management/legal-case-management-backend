package server.entity;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Entity
@Table(name = "legal_relationship_groups")
@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class LegalRelationshipGroup {
    @Id
    @Column(name = "legal_relationship_group_id", nullable = false)
    String legalRelationshipGroupId;
    @Column(name = "legal_relationship_group_name", nullable = false)
    String legalRelationshipGroupName;
    @Column(nullable = false)
    String description;

    @OneToMany(mappedBy = "legalRelationshipGroup", fetch = FetchType.LAZY)
    List<LegalRelationship> legalRelationships;

    @ManyToMany
    List<Judge> judges;
}
