package server.entity;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDate;

@Entity
@Table(name = "additional_acceptance_notices")
@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class AdditionalAcceptanceNotice {
    @Id
    @Column(name = "additional_acceptance_notice_id")
    @GeneratedValue(strategy = GenerationType.UUID)
    String additionalAcceptanceNoticeId;
    @Column(name = "acceptance_number", unique = true)
    String acceptanceNumber;
    @Column(name = "acceptance_date")
    LocalDate acceptanceDate;

    @ManyToOne
    @JoinColumn(name = "legal_case_id")
    LegalCase legalCase;
}
