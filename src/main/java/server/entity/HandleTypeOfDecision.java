package server.entity;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import server.entity.enums.StatusOfLegalCase;

@Entity
@Table(name = "handle_type_of_decisions")
@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
@EqualsAndHashCode
@IdClass(HandleTypeOfDecisionId.class)
public class HandleTypeOfDecision {
    @Id
    @ManyToOne
    @JoinColumn(name = "type_of_decision_id", nullable = false)
    @EqualsAndHashCode.Include
    TypeOfDecision typeOfDecision;
    @Id
    @Enumerated(EnumType.STRING)
    @Column(name = "pre_status", nullable = false)
    @EqualsAndHashCode.Include
    StatusOfLegalCase preStatus;
    @Enumerated(EnumType.STRING)
    @Column(name = "post_status")
    StatusOfLegalCase postStatus;
    @Column(name = "extension_period")
    int extensionPeriod;
}

