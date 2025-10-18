package server.entity;

import jakarta.persistence.Embeddable;
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
    LitigantType litigantType;
    int numericalOrder;
    String name;
    String yearOfBirth;
    String address;
}

