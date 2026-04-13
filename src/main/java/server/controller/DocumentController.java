package server.controller;

import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import server.dto.request.document.DocumentRequest;
import server.dto.response.ApiResponse;
import server.dto.response.document.DocumentResponse;
import server.service.DocumentService;

import java.util.List;

@RestController
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequestMapping("/document")
@Slf4j
public class DocumentController {
    DocumentService documentService;

    @PostMapping
    public ApiResponse<Void> create(@RequestBody @Valid DocumentRequest request) {
        documentService.create(request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Thêm tài liệu, thông báo thành công")
                .build();
    }

    @PutMapping("/{id}")
    public ApiResponse<Void> update(@PathVariable String id, @RequestBody @Valid DocumentRequest request) {
        documentService.update(id, request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Cập nhật tài liệu, thông báo thành công")
                .build();
    }

    @DeleteMapping("/{id}")
    public ApiResponse<Void> delete(@PathVariable String id) {
        documentService.delete(id);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Xóa tài liệu, thông báo thành công")
                .build();
    }

    @GetMapping("/by-legal-case/{legalCaseId}")
    public ApiResponse<List<DocumentResponse>> getByLegalCase(@PathVariable String legalCaseId) {
        return ApiResponse.<List<DocumentResponse>>builder()
                .success(true)
                .status(200)
                .message("Tìm kiếm thành công")
                .data(documentService.getByLegalCase(legalCaseId))
                .build();
    }
}
