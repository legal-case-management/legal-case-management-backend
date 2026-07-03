package com.qlatakv9dt.dto.request.judge;

import lombok.*;
import lombok.experimental.FieldDefaults;
import lombok.experimental.SuperBuilder;
import com.qlatakv9dt.dto.request.officer.OfficerSearchRequest;

@Getter
@Setter
@NoArgsConstructor
@SuperBuilder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
public class JudgeSearchRequest extends OfficerSearchRequest {

}
