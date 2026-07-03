package com.qlatakv9dt.enums;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@AllArgsConstructor
public enum OfficerStatus {
    WORKING("Đang làm việc"),
    NOT_WORKING("Không còn làm việc"),
    ON_BUSINESS_TRIP("Đang công tác"),
    ON_LEAVE("Đang nghĩ phép"),
    DISCIPLINED("Đang bị kĩ luật");

    String name;
}
