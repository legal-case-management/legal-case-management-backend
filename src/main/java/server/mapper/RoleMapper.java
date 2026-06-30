package server.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;
import server.dto.response.role.RoleResponse;
import server.entity.Role;

@Mapper(
        componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE,
        uses = PermissionMapper.class
)
public interface RoleMapper {
    RoleResponse toRoleResponse(Role role);
}
