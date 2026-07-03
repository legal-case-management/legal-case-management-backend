package com.qlatakv9dt.dto.response.mediator;


import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.*;
import lombok.experimental.FieldDefaults;
import lombok.experimental.SuperBuilder;
import com.qlatakv9dt.dto.response.officer.OfficerResponse;

@Getter
@Setter
@NoArgsConstructor
@SuperBuilder
@FieldDefaults(level = AccessLevel.PRIVATE)
@ToString
@JsonInclude(JsonInclude.Include.NON_NULL)
public class MediatorResponse extends OfficerResponse {
    long numberOfLegalCase;
    long numberOfInProcess;
}