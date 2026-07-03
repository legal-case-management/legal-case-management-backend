package com.qlatakv9dt.dto.request.role;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
@FieldDefaults(level = AccessLevel.PRIVATE)
public class RoleSearchRequest {
    /* Từ khóa tìm theo roleId hoặc name */
    String keyword;
}
