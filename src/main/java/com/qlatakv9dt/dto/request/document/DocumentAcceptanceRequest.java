package com.qlatakv9dt.dto.request.document;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class DocumentAcceptanceRequest {
    String acceptanceNumber;
    LocalDate acceptanceDate;
    String documentTypeId;
    String documentNumber;
    LocalDate releaseDate;
    String note;
}
