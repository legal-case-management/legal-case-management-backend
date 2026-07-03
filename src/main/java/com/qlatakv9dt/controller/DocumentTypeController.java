package com.qlatakv9dt.controller;

import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import com.qlatakv9dt.dto.request.documentType.DocumentTypeRequest;
import com.qlatakv9dt.dto.request.documentType.DocumentTypeSearchRequest;
import com.qlatakv9dt.dto.response.ApiResponse;
import com.qlatakv9dt.dto.response.PageResponse;
import com.qlatakv9dt.dto.response.documentType.DocumentTypeResponse;
import com.qlatakv9dt.service.DocumentTypeService;

import java.util.List;

@RestController
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequestMapping("/document-type")
@Slf4j
public class DocumentTypeController {
    DocumentTypeService documentTypeService;

    @GetMapping("/{id}")
    public ApiResponse<DocumentTypeResponse> getById(@PathVariable String id) {
        return ApiResponse.<DocumentTypeResponse>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(documentTypeService.getById(id))
                .build();
    }

    @GetMapping("/all")
    public ApiResponse<List<DocumentTypeResponse>> getAll() {
        return ApiResponse.<List<DocumentTypeResponse>>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(documentTypeService.getAll())
                .build();
    }

    @GetMapping("/by-legal-case-type/{legalCaseTypeId}")
    public ApiResponse<List<DocumentTypeResponse>> getByLegalCaseType(@PathVariable String legalCaseTypeId) {
        return ApiResponse.<List<DocumentTypeResponse>>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(documentTypeService.getByLegalCaseType(legalCaseTypeId))
                .build();
    }

    @PostMapping
    public ApiResponse<Void> create(@RequestBody @Valid DocumentTypeRequest request) {
        documentTypeService.create(request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Thêm loại quyết định, thông báo thành công")
                .build();
    }

    @PutMapping("/{id}")
    public ApiResponse<Void> update(@PathVariable String id, @RequestBody @Valid DocumentTypeRequest request) {
        documentTypeService.update(id, request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Cập nhật loại quyết định, thông báo thành công")
                .build();
    }

    @DeleteMapping("/{id}")
    public ApiResponse<Void> delete(@PathVariable String id) {
        documentTypeService.delete(id);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Xóa loại quyết định, thông báo thành công")
                .build();
    }

    @PostMapping("/search")
    public ApiResponse<PageResponse<DocumentTypeResponse>> search(
            @RequestBody @Valid DocumentTypeSearchRequest request,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "documentTypeId") String sortBy
    ) {
        return ApiResponse.<PageResponse<DocumentTypeResponse>>builder()
                .success(true)
                .status(200)
                .message("Tìm kiếm thành công")
                .data(documentTypeService.search(request, page, size, sortBy))
                .build();
    }
}
