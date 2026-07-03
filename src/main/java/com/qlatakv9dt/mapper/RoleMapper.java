package com.qlatakv9dt.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;
import com.qlatakv9dt.dto.response.role.RoleResponse;
import com.qlatakv9dt.entity.Role;

@Mapper(
        componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE,
        uses = PermissionMapper.class
)
public interface RoleMapper {
    RoleResponse toRoleResponse(Role role);
}
