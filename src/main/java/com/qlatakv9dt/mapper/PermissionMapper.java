package com.qlatakv9dt.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;
import com.qlatakv9dt.dto.response.role.PermissionResponse;
import com.qlatakv9dt.entity.Permission;

@Mapper(
        componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE
)
public interface PermissionMapper {
    PermissionResponse toPermissionResponse(Permission permission);
}
