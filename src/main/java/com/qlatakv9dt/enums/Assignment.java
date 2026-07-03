package com.qlatakv9dt.enums;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@AllArgsConstructor
public enum Assignment {
    ASSIGN("Phân công chỉ định"),
    RANDOM("Phân công ngẩu nhiên");
    String name;
}
