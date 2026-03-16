package server.dto.request.legalCase;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class RandomAssignmentRequest {
    List<String> legalCaseIds;
    String legalRelationshipGroupId;
}
