package server.controller;

import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import server.dto.request.batch.BatchRequest;
import server.dto.request.batch.BatchSearchRequest;
import server.dto.response.ApiResponse;
import server.dto.response.batch.BatchResponse;
import server.service.BatchService;

import java.util.List;

@RestController
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequestMapping("/batch")
@Slf4j
public class BatchController {
    BatchService batchService;

    @GetMapping("/all")
    public ApiResponse<List<BatchResponse>> getAll() {
        return ApiResponse.<List<BatchResponse>>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(batchService.getAll())
                .build();
    }

    @GetMapping("/top-50")
    public ApiResponse<List<BatchResponse>> getTop50() {
        return ApiResponse.<List<BatchResponse>>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(batchService.getTop50())
                .build();
    }

    @PostMapping("/search")
    public ApiResponse<List<BatchResponse>> search(@RequestBody @Valid BatchSearchRequest request) {
        return ApiResponse.<List<BatchResponse>>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(batchService.search(request))
                .build();
    }

    @PutMapping("/{id}")
    public ApiResponse<Void> update(@PathVariable String id, @RequestBody @Valid BatchRequest request) {
        batchService.update(id, request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Cập nhật đợt nhập án thành công")
                .build();
    }

    @DeleteMapping("/{id}")
    public ApiResponse<Void> delete(@PathVariable String id) {
        batchService.delete(id);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Xoá đợt nhập án thành công")
                .build();
    }
}
