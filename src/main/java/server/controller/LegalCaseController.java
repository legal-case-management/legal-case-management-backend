package server.controller;

import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import server.dto.request.JudgeRequest;
import server.dto.request.LegalCaseRequest;
import server.dto.request.LegalCaseSearchRequest;
import server.dto.response.ApiResponse;
import server.dto.response.JudgeResponse;
import server.dto.response.LegalCaseResponse;
import server.service.LegalCaseService;

import java.util.List;

@RestController
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequestMapping("legal-case")
@Slf4j
public class LegalCaseController {
    LegalCaseService legalCaseService;
    @GetMapping("all")
    public ApiResponse<List<LegalCaseResponse>> getAll(){
        return ApiResponse.<List<LegalCaseResponse>>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(legalCaseService.getAll())
                .build();
    }

    @GetMapping("top-50")
    public ApiResponse<List<LegalCaseResponse>> top50(){
        return ApiResponse.<List<LegalCaseResponse>>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(legalCaseService.getLatest50LegalCases())
                .build();
    }

    @PostMapping("search")
    public ApiResponse<List<LegalCaseResponse>> search(@RequestBody @Valid LegalCaseSearchRequest request){
        return ApiResponse.<List<LegalCaseResponse>>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(legalCaseService.search(request))
                .build();
    }

    @PostMapping("")
    public ApiResponse<Void> create(@RequestBody @Valid LegalCaseRequest request){
        legalCaseService.create(request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Thêm án thành công")
                .build();
    }

    @PatchMapping("")
    public ApiResponse<Void> update(@RequestBody @Valid LegalCaseRequest request){
        legalCaseService.update(request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Cập nhật án thành công")
                .build();
    }

    @DeleteMapping("")
    public ApiResponse<Void> delete(@RequestBody @Valid LegalCaseRequest request){
        legalCaseService.delete(request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Xóa án thành công")
                .build();
    }
}
