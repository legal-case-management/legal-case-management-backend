package server.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import lombok.*;
import lombok.experimental.FieldDefaults;
import lombok.experimental.SuperBuilder;
import server.entity.enums.LitigantType;

import java.time.LocalDateTime;

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
    @Column(name = "numerical_order", nullable = false)
    Integer numericalOrder;
    @Column(nullable = false)
    String name;
    @Column(name = "year_of_birth")
    String yearOfBirth;
    String address;
}

