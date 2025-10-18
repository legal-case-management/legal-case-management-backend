package server.dto.response.legalCase;

import lombok.*;
import lombok.experimental.FieldDefaults;
import server.entity.enums.LitigantType;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class LitigantResponse {
    LitigantType litigantType;
    int numericalOrder;
    String name;
    String yearOfBirth;
    String address;
}
