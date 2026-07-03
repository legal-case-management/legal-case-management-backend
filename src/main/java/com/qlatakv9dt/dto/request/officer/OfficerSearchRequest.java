package com.qlatakv9dt.dto.request.officer;

import lombok.*;
import lombok.experimental.FieldDefaults;
import lombok.experimental.SuperBuilder;
import com.qlatakv9dt.enums.OfficerStatus;

@Getter
@Setter
@NoArgsConstructor
@SuperBuilder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class OfficerSearchRequest {
    String officerId;
    String fullName;
    OfficerStatus officerStatus;
}
