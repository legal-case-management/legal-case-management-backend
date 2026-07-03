package com.qlatakv9dt.controller;

import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import com.qlatakv9dt.dto.request.mediator.MediatorRequest;
import com.qlatakv9dt.dto.request.mediator.MediatorSearchRequest;
import com.qlatakv9dt.dto.response.ApiResponse;
import com.qlatakv9dt.dto.response.PageResponse;
import com.qlatakv9dt.dto.response.mediator.MediatorResponse;
import com.qlatakv9dt.service.MediatorService;

import java.util.List;

@RestController
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequestMapping("/mediator")
@Slf4j
public class MediatorController {
    MediatorService mediatorService;
    @GetMapping("/all")
    public ApiResponse<List<MediatorResponse>> getAll(){
        return ApiResponse.<List<MediatorResponse>>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(mediatorService.getAll())
                .build();
    }

    @PostMapping("/search")
    public ApiResponse<PageResponse<MediatorResponse>> search(
            @RequestBody @Valid MediatorSearchRequest request,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "officerId") String sortBy
    ) {

        return ApiResponse.<PageResponse<MediatorResponse>>builder()
                .success(true)
                .status(200)
                .message("Successful")
                .data(mediatorService.search(request, page, size, sortBy))
                .build();
    }


    @PostMapping
    public ApiResponse<Void> create(@RequestBody @Valid MediatorRequest request){
        mediatorService.create(request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Thêm hòa giải viên thành công")
                .build();
    }

    @PutMapping("/{id}")
    public ApiResponse<Void> update(@PathVariable String id, @RequestBody @Valid MediatorRequest request){
        mediatorService.update(id, request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Cập nhật hòa giải viên thành công")
                .build();
    }

    @DeleteMapping("/{id}")
    public ApiResponse<Void> delete(@PathVariable String id){
        mediatorService.delete(id);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Xoá hòa giải viên thành công")
                .build();
    }
}
