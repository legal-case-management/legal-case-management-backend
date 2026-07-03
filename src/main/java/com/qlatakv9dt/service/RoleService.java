package com.qlatakv9dt.service;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.qlatakv9dt.constant.RoleCatalog;
import com.qlatakv9dt.dto.request.role.RoleRequest;
import com.qlatakv9dt.dto.response.PageResponse;
import com.qlatakv9dt.dto.response.role.PermissionResponse;
import com.qlatakv9dt.dto.response.role.RoleResponse;
import com.qlatakv9dt.entity.Permission;
import com.qlatakv9dt.entity.Role;
import com.qlatakv9dt.exception.AppException;
import com.qlatakv9dt.exception.ErrorCode;
import com.qlatakv9dt.mapper.PageMapper;
import com.qlatakv9dt.mapper.PermissionMapper;
import com.qlatakv9dt.mapper.RoleMapper;
import com.qlatakv9dt.repository.AccountRepository;
import com.qlatakv9dt.repository.PermissionRepository;
import com.qlatakv9dt.repository.RoleRepository;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.regex.Pattern;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class RoleService {
    /* Mã vai trò: in hoa + dấu gạch dưới, không bắt đầu bằng số, không khoảng trắng */
    static Pattern ROLE_ID_PATTERN = Pattern.compile("^[A-Z][A-Z0-9_]*$");

    RoleRepository roleRepository;
    PermissionRepository permissionRepository;
    AccountRepository accountRepository;

    RoleMapper roleMapper;
    PermissionMapper permissionMapper;
    PageMapper pageMapper;

    @PreAuthorize("hasAuthority('VIEW_ROLE')")
    public List<RoleResponse> getAll() {
        return roleRepository.findAll(Sort.by("roleId").ascending())
                .stream()
                .map(roleMapper::toRoleResponse)
                .toList();
    }

    @PreAuthorize("hasAuthority('VIEW_ROLE')")
    public PageResponse<RoleResponse> search(String keyword, int page, int size, String sortBy) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(sortBy).ascending());
        Page<RoleResponse> resultPage = roleRepository
                .search(keyword, pageable)
                .map(roleMapper::toRoleResponse);
        return pageMapper.map(resultPage);
    }

    @PreAuthorize("hasAuthority('VIEW_PERMISSION')")
    public PageResponse<PermissionResponse> searchPermissions(String keyword, int page, int size) {
        Pageable pageable = PageRequest.of(page, size, Sort.by("permissionId").ascending());
        Page<PermissionResponse> resultPage = permissionRepository
                .search(keyword, pageable)
                .map(permissionMapper::toPermissionResponse);
        return pageMapper.map(resultPage);
    }

    @PreAuthorize("hasAuthority('CREATE_ROLE')")
    @Transactional
    public void create(RoleRequest request) {
        String roleId = request.getRoleId();
        if (roleId == null || !ROLE_ID_PATTERN.matcher(roleId).matches()) {
            throw new AppException(ErrorCode.ROLE_ID_INVALID);
        }
        if (roleRepository.existsById(roleId)) {
            throw new AppException(ErrorCode.ROLE_EXISTED);
        }

        Role role = Role.builder()
                .roleId(roleId)
                .name(request.getName())
                .description(request.getDescription())
                .permissions(resolvePermissions(request.getPermissionIds()))
                .build();

        roleRepository.save(role);
    }

    @PreAuthorize("hasAuthority('UPDATE_ROLE')")
    @Transactional
    public void update(String roleId, RoleRequest request) {
        if (RoleCatalog.ADMIN.equals(roleId)) {
            throw new AppException(ErrorCode.ROLE_ADMIN_IMMUTABLE);
        }

        Role role = roleRepository.findById(roleId)
                .orElseThrow(() -> new AppException(ErrorCode.ROLE_NOT_EXISTED));

        role.setName(request.getName());
        role.setDescription(request.getDescription());
        role.setPermissions(resolvePermissions(request.getPermissionIds()));

        roleRepository.save(role);
    }

    @PreAuthorize("hasAuthority('DELETE_ROLE')")
    @Transactional
    public void delete(String roleId) {
        if (RoleCatalog.ADMIN.equals(roleId)) {
            throw new AppException(ErrorCode.ROLE_ADMIN_IMMUTABLE);
        }

        Role role = roleRepository.findById(roleId)
                .orElseThrow(() -> new AppException(ErrorCode.ROLE_NOT_EXISTED));

        if (accountRepository.existsByRoleRoleId(roleId)) {
            throw new AppException(ErrorCode.ROLE_IN_USE);
        }

        roleRepository.delete(role);
    }

    /** Nạp tập Permission từ danh sách permissionId; bỏ qua nếu rỗng/null. */
    private Set<Permission> resolvePermissions(Set<String> permissionIds) {
        if (permissionIds == null || permissionIds.isEmpty()) {
            return new HashSet<>();
        }
        List<Permission> found = permissionRepository.findAllById(permissionIds);
        if (found.size() != permissionIds.size()) {
            throw new AppException(ErrorCode.PERMISSION_NOT_EXISTED);
        }
        return new HashSet<>(found);
    }
}
