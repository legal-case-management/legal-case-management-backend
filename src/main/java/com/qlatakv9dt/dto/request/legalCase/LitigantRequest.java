package com.qlatakv9dt.dto.request.legalCase;

import lombok.*;
import lombok.experimental.FieldDefaults;
import com.qlatakv9dt.enums.LitigantType;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class LitigantRequest {
    LitigantType litigantType;
    int ordinal;
    String name;
    Integer yearOfBirth;
    String address;
}
