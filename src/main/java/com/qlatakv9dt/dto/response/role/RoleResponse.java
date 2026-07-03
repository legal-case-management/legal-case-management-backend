package com.qlatakv9dt.dto.response.role;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class RoleResponse {
    String roleId;
    String name;
    String description;
    List<PermissionResponse> permissions;
}
