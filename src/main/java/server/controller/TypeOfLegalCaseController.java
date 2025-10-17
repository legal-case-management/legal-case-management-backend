package server.controller;

import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import server.dto.request.legalCaseType.LegalCaseTypeRequest;
import server.dto.request.legalCaseType.LegalCaseTypeSearchRequest;
import server.dto.response.ApiResponse;
import server.dto.response.PageResponse;
import server.dto.response.legalCaseType.LegalCaseTypeResponse;
import server.service.LegalCaseTypeService;

import java.util.List;

@RestController
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequestMapping("/type-of-legal-case")
@Slf4j
public class TypeOfLegalCaseController {
    LegalCaseTypeService typeOfLegalCaseService;

    @GetMapping("/all")
    public ApiResponse<List<LegalCaseTypeResponse>> getAll() {
        return ApiResponse.<List<LegalCaseTypeResponse>>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(typeOfLegalCaseService.getAll())
                .build();
    }

    @PostMapping
    public ApiResponse<Void> create(@RequestBody @Valid LegalCaseTypeRequest request) {
        typeOfLegalCaseService.create(request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Thêm loại án thành công")
                .build();
    }

    @PutMapping("/{id}")
    public ApiResponse<Void> update(@PathVariable String id, @RequestBody @Valid LegalCaseTypeRequest request) {
        typeOfLegalCaseService.update(id, request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Cập nhật loại án thành công")
                .build();
    }

    @DeleteMapping("/{id}")
    public ApiResponse<Void> delete(@PathVariable String id) {
        typeOfLegalCaseService.delete(id);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Xóa loại án thành công")
                .build();
    }

    @PostMapping("/search")
    public ApiResponse<PageResponse<LegalCaseTypeResponse>> search(
            @RequestBody @Valid LegalCaseTypeSearchRequest request,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "typeOfLegalCaseId") String sortBy
    ) {
        return ApiResponse.<PageResponse<LegalCaseTypeResponse>>builder()
                .success(true)
                .status(200)
                .message("Tìm kiếm thành công")
                .data(typeOfLegalCaseService.search(request, page, size, sortBy))
                .build();
    }

}
