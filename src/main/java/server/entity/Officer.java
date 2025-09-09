package server.entity;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import lombok.experimental.SuperBuilder;
import server.entity.enums.StatusOfOfficer;

@Entity
@Table(name = "officers")
@FieldDefaults(level = AccessLevel.PROTECTED)
@Getter
@Setter
@ToString
@NoArgsConstructor
@SuperBuilder
@Inheritance(strategy = InheritanceType.JOINED)
public abstract class Officer {
    @Id
    @Column(name = "officer_id", nullable = false)
    String officerId;
    @Column(name = "first_name", nullable = false)
    String firstName;
    @Column(name = "last_name", nullable = false)
    String lastName;
    @Column(name = "full_name", insertable = false, updatable = false, nullable = false)
    String fullName;
    @Enumerated(EnumType.STRING)
    @Column(name = "status_of_officer", nullable = false)
    StatusOfOfficer statusOfOfficer;

    @OneToOne(mappedBy = "officer")
    Account account;
}
