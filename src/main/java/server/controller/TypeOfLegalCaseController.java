package server.controller;

import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import server.dto.request.typeOfLegalCase.TypeOfLegalCaseRequest;
import server.dto.request.typeOfLegalCase.TypeOfLegalCaseSearchRequest;
import server.dto.response.ApiResponse;
import server.dto.response.typeOfLegalCase.TypeOfLegalCaseResponse;
import server.service.TypeOfLegalCaseService;

import java.util.List;

@RestController
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequestMapping("/type-of-legal-case")
@Slf4j
public class TypeOfLegalCaseController {
    TypeOfLegalCaseService typeOfLegalCaseService;

    @GetMapping("/all")
    public ApiResponse<List<TypeOfLegalCaseResponse>> getAll() {
        return ApiResponse.<List<TypeOfLegalCaseResponse>>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(typeOfLegalCaseService.getAll())
                .build();
    }

    @PostMapping("/")
    public ApiResponse<Void> create(@RequestBody @Valid TypeOfLegalCaseRequest request) {
        typeOfLegalCaseService.create(request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Thêm loại án thành công")
                .build();
    }

    @PutMapping("/{id}")
    public ApiResponse<Void> update(@PathVariable String id, @RequestBody @Valid TypeOfLegalCaseRequest request) {
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
    public ApiResponse<List<TypeOfLegalCaseResponse>> search(@RequestBody @Valid TypeOfLegalCaseSearchRequest request) {
        return ApiResponse.<List<TypeOfLegalCaseResponse>>builder()
                .success(true)
                .status(200)
                .message("Tìm kiếm thành công")
                .data(typeOfLegalCaseService.search(request))
                .build();
    }

    @GetMapping("/top-50")
    public ApiResponse<List<TypeOfLegalCaseResponse>> getTop50() {
        return ApiResponse.<List<TypeOfLegalCaseResponse>>builder()
                .success(true)
                .status(200)
                .message("Tìm kiếm thành công")
                .data(typeOfLegalCaseService.getTop50())
                .build();
    }
}
