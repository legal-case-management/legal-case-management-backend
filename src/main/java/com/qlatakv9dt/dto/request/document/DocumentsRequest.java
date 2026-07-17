package com.qlatakv9dt.dto.request.document;

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
public class DocumentsRequest {
    boolean isMediator;
    List<DocumentAcceptanceRequest> documents;
}
