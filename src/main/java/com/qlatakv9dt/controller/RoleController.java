package com.qlatakv9dt.controller;

import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import com.qlatakv9dt.dto.request.role.RoleRequest;
import com.qlatakv9dt.dto.request.role.RoleSearchRequest;
import com.qlatakv9dt.dto.response.ApiResponse;
import com.qlatakv9dt.dto.response.PageResponse;
import com.qlatakv9dt.dto.response.role.PermissionResponse;
import com.qlatakv9dt.dto.response.role.RoleResponse;
import com.qlatakv9dt.service.RoleService;

import java.util.List;

@RestController
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequestMapping("/role")
@Slf4j
public class RoleController {
    RoleService roleService;

    @GetMapping("/all")
    public ApiResponse<List<RoleResponse>> getAll() {
        return ApiResponse.<List<RoleResponse>>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(roleService.getAll())
                .build();
    }

    @PostMapping("/search")
    public ApiResponse<PageResponse<RoleResponse>> search(
            @RequestBody @Valid RoleSearchRequest request,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "roleId") String sortBy
    ) {
        return ApiResponse.<PageResponse<RoleResponse>>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(roleService.search(request.getKeyword(), page, size, sortBy))
                .build();
    }

    @PostMapping("/permission/search")
    public ApiResponse<PageResponse<PermissionResponse>> searchPermissions(
            @RequestBody @Valid RoleSearchRequest request,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size
    ) {
        return ApiResponse.<PageResponse<PermissionResponse>>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(roleService.searchPermissions(request.getKeyword(), page, size))
                .build();
    }

    @PostMapping
    public ApiResponse<Void> create(@RequestBody @Valid RoleRequest request) {
        roleService.create(request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Thêm vai trò thành công")
                .build();
    }

    @PutMapping("/{id}")
    public ApiResponse<Void> update(@PathVariable String id, @RequestBody @Valid RoleRequest request) {
        roleService.update(id, request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Cập nhật vai trò thành công")
                .build();
    }

    @DeleteMapping("/{id}")
    public ApiResponse<Void> delete(@PathVariable String id) {
        roleService.delete(id);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Xóa vai trò thành công")
                .build();
    }
}
