package server.controller;

import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import server.dto.request.decisionType.DecisionTypeRequest;
import server.dto.request.decisionType.DecisionTypeSearchRequest;
import server.dto.response.ApiResponse;
import server.dto.response.PageResponse;
import server.dto.response.decisionType.DecisionTypeResponse;
import server.service.DecisionTypeService;

import java.util.List;

@RestController
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequestMapping("/decision-type")
@Slf4j
public class DecisionTypeController {
    DecisionTypeService decisionTypeService;

    @GetMapping("/{id}")
    public ApiResponse<DecisionTypeResponse> getById(@PathVariable String id) {
        return ApiResponse.<DecisionTypeResponse>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(decisionTypeService.getById(id))
                .build();
    }

    @GetMapping("/all")
    public ApiResponse<List<DecisionTypeResponse>> getAll() {
        return ApiResponse.<List<DecisionTypeResponse>>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(decisionTypeService.getAll())
                .build();
    }

    @GetMapping("/by-legal-case-type/{legalCaseTypeId}")
    public ApiResponse<List<DecisionTypeResponse>> getByLegalCaseType(@PathVariable String legalCaseTypeId) {
        return ApiResponse.<List<DecisionTypeResponse>>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(decisionTypeService.getByLegalCaseType(legalCaseTypeId))
                .build();
    }

    @PostMapping
    public ApiResponse<Void> create(@RequestBody @Valid DecisionTypeRequest request) {
        decisionTypeService.create(request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Thêm loại quyết định, thông báo thành công")
                .build();
    }

    @PutMapping("/{id}")
    public ApiResponse<Void> update(@PathVariable String id, @RequestBody @Valid DecisionTypeRequest request) {
        decisionTypeService.update(id, request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Cập nhật loại quyết định, thông báo thành công")
                .build();
    }

    @DeleteMapping("/{id}")
    public ApiResponse<Void> delete(@PathVariable String id) {
        decisionTypeService.delete(id);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Xóa loại quyết định, thông báo thành công")
                .build();
    }

    @PostMapping("/search")
    public ApiResponse<PageResponse<DecisionTypeResponse>> search(
            @RequestBody @Valid DecisionTypeSearchRequest request,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "decisionTypeId") String sortBy
    ) {
        return ApiResponse.<PageResponse<DecisionTypeResponse>>builder()
                .success(true)
                .status(200)
                .message("Tìm kiếm thành công")
                .data(decisionTypeService.search(request, page, size, sortBy))
                .build();
    }

}
