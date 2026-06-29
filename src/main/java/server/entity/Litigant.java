package server.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import lombok.*;
import lombok.experimental.FieldDefaults;
import lombok.experimental.SuperBuilder;
import server.enums.LitigantType;

@Embeddable
@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
@SuperBuilder
public class Litigant {
    @Enumerated(EnumType.STRING)
    @Column(name = "litigant_type", nullable = false)
    LitigantType litigantType;
    @Column(nullable = false)
    int ordinal;
    @Column(nullable = false)
    String name;
    @Column(name = "year_of_birth")
    Integer yearOfBirth;
    String address;
}

