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
    int ordinal;
    String name;
    Integer yearOfBirth;
    String address;
}
