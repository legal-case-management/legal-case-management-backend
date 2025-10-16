package server.dto.request.litigant;

import lombok.*;
import lombok.experimental.FieldDefaults;
import server.entity.LegalCase;
import server.entity.enums.LitigantType;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class LitigantRequest {
    LitigantType litigantType;
    int numericalOrder;
    String name;
    String yearOfBirth;
    String address;
}
