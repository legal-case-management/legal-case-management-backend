package server.controller;

import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import server.dto.request.decision.DecisionRequest;
import server.dto.response.ApiResponse;
import server.dto.response.decision.DecisionResponse;
import server.service.DecisionService;

import java.util.List;

@RestController
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequestMapping("/decision")
@Slf4j
public class DecisionController {
    DecisionService decisionService;

    @PostMapping("/")
    public ApiResponse<Void> create(@RequestBody @Valid DecisionRequest request) {
        decisionService.create(request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Thêm quyết định, thông báo thành công")
                .build();
    }

    @PutMapping("/{id}")
    public ApiResponse<Void> update(@PathVariable String id, @RequestBody @Valid DecisionRequest request) {
        decisionService.update(id, request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Cập nhật quyết định, thông báo thành công")
                .build();
    }

    @DeleteMapping("/{id}")
    public ApiResponse<Void> delete(@PathVariable String id) {
        decisionService.delete(id);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Xóa quyết định, thông báo thành công")
                .build();
    }

    @GetMapping("/by-legal-case/{legalCaseId}")
    public ApiResponse<List<DecisionResponse>> getByLegalCase(@PathVariable String legalCaseId) {
        return ApiResponse.<List<DecisionResponse>>builder()
                .success(true)
                .status(200)
                .message("Tìm kiếm thành công")
                .data(decisionService.getByLegalCase(legalCaseId))
                .build();
    }
}
