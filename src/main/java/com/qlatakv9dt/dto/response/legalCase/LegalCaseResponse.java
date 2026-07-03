package com.qlatakv9dt.dto.response.legalCase;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import lombok.experimental.FieldDefaults;
import com.qlatakv9dt.dto.response.batch.BatchResponse;
import com.qlatakv9dt.dto.response.judge.JudgeResponse;
import com.qlatakv9dt.dto.response.legalRelationship.LegalRelationshipResponse;
import com.qlatakv9dt.dto.response.mediator.MediatorResponse;
import com.qlatakv9dt.enums.Assignment;
import com.qlatakv9dt.enums.LegalCaseStatus;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class LegalCaseResponse {
    String legalCaseId;
    String acceptanceNumber;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    LocalDate acceptanceDate;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    LocalDate expiredDate;
    String note;
    LegalRelationshipResponse legalRelationship;
    List<LitigantResponse> litigants;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    LocalDateTime storageDate;
    Assignment assignment;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    LocalDateTime assignmentDate;
    LegalCaseStatus legalCaseStatus;
    BatchResponse batch;
    JudgeResponse judge;
    MediatorResponse mediator;
    List<String> decisionInfos;
}