package server.entity;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDate;

@Entity
@Table(name = "additional_receptions")
@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class AdditionalReception {
    @Id
    @Column(name = "additional_deception_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    long additionalReceptionId;
    @Column(name = "reception_number")
    String receptionNumber;
    @Column(name = "reception_date")
    LocalDate receptionDate;

    @ManyToOne
    @JoinColumn(name = "legal_case_id")
    LegalCase legalCase;
}
