package server.entity;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Entity
@Table(name = "type_of_legal_cases")
@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class TypeOfLegalCase {
    @Id
    @Column(name = "type_of_legal_case_id", nullable = false)
    String typeOfLegalCaseId;

    @Column(name = "type_of_legal_case_name", nullable = false, unique = true)
    String typeOfLegalCaseName;

    @Column(name = "code_name", nullable = false, unique = true)
    String codeName;

    @OneToMany(mappedBy = "typeOfLegalCase")
    List<LegalRelationship> legalRelationships;
}
