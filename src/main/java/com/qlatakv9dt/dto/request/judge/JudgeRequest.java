package com.qlatakv9dt.dto.request.judge;

import lombok.*;
import lombok.experimental.FieldDefaults;
import lombok.experimental.SuperBuilder;
import com.qlatakv9dt.dto.request.officer.OfficerRequest;

import java.util.Set;

@Getter
@Setter
@NoArgsConstructor
@SuperBuilder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class JudgeRequest extends OfficerRequest {
    Long maxWithMediator;
    Long maxWithoutMediator;
    Set<String> restrictedGroupIds;
}
