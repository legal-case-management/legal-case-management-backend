package server.entity;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import server.entity.enums.LegalCaseStatus;

@Entity
@Table(name = "handle_decision_types")
@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
@EqualsAndHashCode
@IdClass(HandleDecisionType.HandleDecisionTypeId.class)
public class HandleDecisionType {
    @Id
    @ManyToOne
    @JoinColumn(name = "decision_type_id", nullable = false)
    @EqualsAndHashCode.Include
    DecisionType decisionType;
    @Id
    @Enumerated(EnumType.STRING)
    @Column(name = "pre_status", nullable = false)
    @EqualsAndHashCode.Include
    LegalCaseStatus preStatus;
    @Enumerated(EnumType.STRING)
    @Column(name = "post_status")
    LegalCaseStatus postStatus;
    @Column(name = "extension_period")
    int extensionPeriod;
    @Column(name = "is_active", nullable = false)
    boolean isActive;

    @EqualsAndHashCode
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder
    @FieldDefaults(level = AccessLevel.PRIVATE)
    @Getter
    @Setter
    public static class HandleDecisionTypeId{
        DecisionType decisionType;
        LegalCaseStatus preStatus;
    }
}

