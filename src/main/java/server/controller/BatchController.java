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
import server.dto.request.batch.BatchRequest;
import server.dto.request.batch.BatchSearchRequest;
import server.dto.response.ApiResponse;
import server.dto.response.PageResponse;
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

    @PostMapping("/search")
    public ApiResponse<PageResponse<BatchResponse>> search(
            @RequestBody @Valid BatchSearchRequest request,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "batchId") String sortBy
    ) {
        return ApiResponse.<PageResponse<BatchResponse>>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(batchService.search(request, page, size, sortBy))
                .build();
    }

    @PostMapping
    public ApiResponse<Void> create(@RequestBody @Valid BatchRequest request) {
        batchService.create(request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Thêm đợt nhập án thành công")
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
