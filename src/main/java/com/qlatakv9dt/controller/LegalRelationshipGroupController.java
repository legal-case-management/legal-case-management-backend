package com.qlatakv9dt.controller;

import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import com.qlatakv9dt.dto.request.legalRelationshipGroup.LegalRelationshipGroupRequest;
import com.qlatakv9dt.dto.request.legalRelationshipGroup.LegalRelationshipGroupSearchRequest;
import com.qlatakv9dt.dto.response.ApiResponse;
import com.qlatakv9dt.dto.response.PageResponse;
import com.qlatakv9dt.dto.response.legalRelationshipGroup.LegalRelationshipGroupResponse;
import com.qlatakv9dt.service.LegalRelationshipGroupService;

import java.util.List;

@RestController
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequestMapping("/legal-relationship-group")
@Slf4j
public class LegalRelationshipGroupController {
    LegalRelationshipGroupService legalRelationshipGroupService;
    @GetMapping("/all")
    public ApiResponse<List<LegalRelationshipGroupResponse>> getAll(){
        return ApiResponse.<List<LegalRelationshipGroupResponse>>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(legalRelationshipGroupService.getAll())
                .build();
    }

    @PostMapping("/search")
    public ApiResponse<PageResponse<LegalRelationshipGroupResponse>> search(
            @RequestBody @Valid LegalRelationshipGroupSearchRequest request,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "legalRelationshipGroupId") String sortBy
    ) {
        return ApiResponse.<PageResponse<LegalRelationshipGroupResponse>>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(legalRelationshipGroupService.search(request, page, size, sortBy))
                .build();
    }


    @PostMapping
    public ApiResponse<Void> create(@RequestBody @Valid LegalRelationshipGroupRequest request){
        legalRelationshipGroupService.create(request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Thêm nhóm quan hệ pháp luật thành công")
                .build();
    }

    @PutMapping("/{id}")
    public ApiResponse<Void> update(@PathVariable String id, @RequestBody @Valid LegalRelationshipGroupRequest request){
        legalRelationshipGroupService.update(id, request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Cập nhật nhóm quan hệ pháp luật thành công")
                .build();
    }

    @DeleteMapping("/{id}")
    public ApiResponse<Void> delete(@PathVariable String id){
        legalRelationshipGroupService.delete(id);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Xóa nhóm quan hệ pháp luật thành công")
                .build();
    }
}
