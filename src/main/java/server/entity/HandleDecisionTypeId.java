package server.entity;

import lombok.*;
import lombok.experimental.FieldDefaults;
import server.entity.enums.LegalCaseStatus;


@Getter
@Setter
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class HandleDecisionTypeId {
    DecisionType decisionType;
    LegalCaseStatus preStatus;
}