package server.entity;

import lombok.*;
import lombok.experimental.FieldDefaults;
import server.entity.enums.StatusOfLegalCase;

import java.io.Serializable;

@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class HandleTypeOfDecisionId implements Serializable {
    TypeOfDecision typeOfDecision;
    StatusOfLegalCase preStatus;
}