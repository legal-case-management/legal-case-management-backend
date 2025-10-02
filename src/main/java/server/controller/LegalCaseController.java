package server.controller;

import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.*;
import server.dto.request.legalCase.*;
import server.dto.response.ApiResponse;
import server.dto.response.PageResponse;
import server.dto.response.legalCase.LegalCaseResponse;
import server.service.LegalCaseService;

import java.util.List;

@RestController
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequestMapping("/legal-case")
@Slf4j
public class LegalCaseController {
    LegalCaseService legalCaseService;

    @GetMapping("/all")
    public ApiResponse<List<LegalCaseResponse>> getAll() {
        return ApiResponse.<List<LegalCaseResponse>>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(legalCaseService.getAll())
                .build();
    }


    @PostMapping("/search")
    public ApiResponse<PageResponse<LegalCaseResponse>> search(
            @RequestBody @Valid LegalCaseSearchRequest request,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "legalCaseId") String sortBy
    ) {
        return ApiResponse.<PageResponse<LegalCaseResponse>>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(legalCaseService.search(request, page, size, sortBy))
                .build();
    }

    @PostMapping
    public ApiResponse<Void> create(@RequestBody @Valid LegalCaseRequest request) {
        legalCaseService.create(request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Thêm án thành công")
                .build();
    }

    @PostMapping("/import-excel")
    public ApiResponse<Void> importFromExcel(@RequestBody @Valid LegalCasesRequest request) {
        legalCaseService.importFromExcel(request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Thêm án thành công")
                .build();
    }

    @PutMapping("/{id}")
    public ApiResponse<Void> update(@PathVariable String id, @RequestBody @Valid LegalCaseRequest request) {
        legalCaseService.update(id, request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Cập nhật án thành công")
                .build();
    }

    @DeleteMapping("/{id}")
    public ApiResponse<Void> delete(@PathVariable String id) {
        legalCaseService.delete(id);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Xóa án thành công")
                .build();
    }

    @GetMapping("/{id}")
    public ApiResponse<LegalCaseResponse> getById(@PathVariable String id) {
        return ApiResponse.<LegalCaseResponse>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(legalCaseService.getById(id))
                .build();
    }

    @PostMapping("/random-assignment")
    public ApiResponse<Void> randomAssignment(@RequestBody @Valid RandomAssignmentRequest request) {
        legalCaseService.randomAssignment(request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Phân công án ngẫu nhiên thành công")
                .build();
    }

    @PostMapping("/assign-assignment")
    public ApiResponse<Void> assignAssignment(@RequestBody @Valid AssignAssignmentRequest request) {
        legalCaseService.assignAssignment(request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Phân công án chỉ định thành công")
                .build();
    }

    @PostMapping("/assignment-list")
    public ApiResponse<PageResponse<LegalCaseResponse>> getAssignmentList(
            @RequestBody @Valid AssignmentListRequest request,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "legalCaseId") String sortBy
    ) {
        return ApiResponse.<PageResponse<LegalCaseResponse>>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(legalCaseService.getAssignmentList(request, page, size, sortBy))
                .build();
    }
}