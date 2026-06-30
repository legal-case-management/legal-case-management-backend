package server.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;
import server.dto.response.role.PermissionResponse;
import server.entity.Permission;

@Mapper(
        componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE
)
public interface PermissionMapper {
    PermissionResponse toPermissionResponse(Permission permission);
}
