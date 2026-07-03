package com.qlatakv9dt.controller;

import jakarta.validation.Valid;
import com.qlatakv9dt.dto.request.judge.JudgeRequest;
import com.qlatakv9dt.dto.request.judge.JudgeSearchRequest;
import com.qlatakv9dt.dto.response.ApiResponse;
import com.qlatakv9dt.dto.response.PageResponse;
import com.qlatakv9dt.dto.response.judge.JudgeAssignmentInfoResponse;
import com.qlatakv9dt.dto.response.judge.JudgeResponse;
import com.qlatakv9dt.service.JudgeService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequestMapping("/judge")
@Slf4j
public class JudgeController {
    JudgeService judgeService;

    @GetMapping("/all")
    public ApiResponse<List<JudgeResponse>> getAll() {
        return ApiResponse.<List<JudgeResponse>>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(judgeService.getAll())
                .build();
    }

    @PostMapping("/search")
    public ApiResponse<PageResponse<JudgeResponse>> search(
            @RequestBody @Valid JudgeSearchRequest request,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "officerId") String sortBy
    ) {
        return ApiResponse.<PageResponse<JudgeResponse>>builder()
                .success(true)
                .status(200)
                .message("Successful")
                .data(judgeService.search(request, page, size, sortBy))
                .build();
    }

    @GetMapping("/list-assignment")
    public ApiResponse<List<JudgeAssignmentInfoResponse>> listAssignment(@RequestParam(required = false) String legalRelationshipGroupId) {
        return ApiResponse.<List<JudgeAssignmentInfoResponse>>builder()
                .success(true)
                .status(200)
                .message("Successful")
                .data(judgeService.listAssignment(legalRelationshipGroupId))
                .build();
    }

    @PostMapping
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
