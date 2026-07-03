package com.qlatakv9dt.dto.request.role;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.Set;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class RoleRequest {
    /* VD: MANAGER - chỉ dùng khi tạo mới (in hoa, dấu _, không bắt đầu bằng số) */
    String roleId;

    /* VD: Quản lý */
    String name;

    /* VD: Quản lý nghiệp vụ án */
    String description;

    /* Danh sách permissionId được gán cho vai trò */
    Set<String> permissionIds;
}
