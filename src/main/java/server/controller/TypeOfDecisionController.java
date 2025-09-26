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
import server.dto.request.typeOfDecision.TypeOfDecisionRequest;
import server.dto.request.typeOfDecision.TypeOfDecisionSearchRequest;
import server.dto.response.ApiResponse;
import server.dto.response.PageResponse;
import server.dto.response.typeOfDecision.TypeOfDecisionResponse;
import server.service.TypeOfDecisionService;

import java.util.List;

@RestController
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequestMapping("/type-of-decision")
@Slf4j
public class TypeOfDecisionController {
    TypeOfDecisionService typeOfDecisionService;

    @GetMapping("/all")
    public ApiResponse<List<TypeOfDecisionResponse>> getAll() {
        return ApiResponse.<List<TypeOfDecisionResponse>>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(typeOfDecisionService.getAll())
                .build();
    }

    @PostMapping
    public ApiResponse<Void> create(@RequestBody @Valid TypeOfDecisionRequest request) {
        typeOfDecisionService.create(request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Thêm loại quyết định, thông báo thành công")
                .build();
    }

    @PutMapping("/{id}")
    public ApiResponse<Void> update(@PathVariable String id, @RequestBody @Valid TypeOfDecisionRequest request) {
        typeOfDecisionService.update(id, request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Cập nhật loại quyết định, thông báo thành công")
                .build();
    }

    @DeleteMapping("/{id}")
    public ApiResponse<Void> delete(@PathVariable String id) {
        typeOfDecisionService.delete(id);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Xóa loại quyết định, thông báo thành công")
                .build();
    }

    @PostMapping("/search")
    public ApiResponse<PageResponse<TypeOfDecisionResponse>> search(
            @RequestBody @Valid TypeOfDecisionSearchRequest request,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "typeOfDecisionId") String sortBy
    ) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(sortBy).ascending());

        return ApiResponse.<PageResponse<TypeOfDecisionResponse>>builder()
                .success(true)
                .status(200)
                .message("Tìm kiếm thành công")
                .data(typeOfDecisionService.search(request, pageable))
                .build();
    }


    @GetMapping("/limit-{limit}")
    public ApiResponse<List<TypeOfDecisionResponse>> getLimit(@PathVariable int limit) {
        return ApiResponse.<List<TypeOfDecisionResponse>>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(typeOfDecisionService.getLimit(limit))
                .build();
    }
}
