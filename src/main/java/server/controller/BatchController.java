package server.controller;

import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import server.dto.request.batch.BatchRequest;
import server.dto.request.judge.JudgeRequest;
import server.dto.request.judge.JudgeSearchRequest;
import server.dto.response.ApiResponse;
import server.dto.response.batch.BatchResponse;
import server.dto.response.judge.JudgeResponse;
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
    public ApiResponse<List<BatchResponse>> search(@RequestBody @Valid BatchRequest request) {
        return ApiResponse.<List<BatchResponse>>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(batchService.search(request))
                .build();
    }

    @GetMapping("/myInfo")
    public ApiResponse<JudgeResponse> getMyInfo() {
        return ApiResponse.<JudgeResponse>builder()
                .success(true)
                .status(200)
                .message("Successful")
                .data(judgeService.getMyInfo())
                .build();
    }

    @PostMapping("/")
    public ApiResponse<Void> create(@RequestBody @Valid JudgeRequest request) {
        judgeService.create(request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Thêm thẩm phán thành công")
                .build();
    }

    @PutMapping("/{id}")
    public ApiResponse<Void> update(@PathVariable String id, @RequestBody @Valid JudgeRequest request) {
        judgeService.update(id, request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Cập nhật thẩm phán thành công")
                .build();
    }

    @DeleteMapping("/{id}")
    public ApiResponse<Void> delete(@PathVariable String id) {
        judgeService.delete(id);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Xoá thẩm phán thành công")
                .build();
    }
}
