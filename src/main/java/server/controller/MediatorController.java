package server.controller;

import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import server.dto.request.judge.JudgeRequest;
import server.dto.request.judge.JudgeSearchRequest;
import server.dto.request.mediator.MediatorRequest;
import server.dto.request.mediator.MediatorSearchRequest;
import server.dto.response.ApiResponse;
import server.dto.response.judge.JudgeResponse;
import server.dto.response.mediator.MediatorResponse;
import server.service.MediatorService;

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

    @GetMapping("/limit-{limit}")
    public ApiResponse<List<MediatorResponse>> getTop50(@PathVariable int limit){
        return ApiResponse.<List<MediatorResponse>>builder()
                .success(true)
                .status(200)
                .message("Successful")
                .data(mediatorService.getLimit(limit))
                .build();
    }

    @PostMapping("/search")
    public ApiResponse<List<MediatorResponse>> search(@RequestBody @Valid MediatorSearchRequest request){
        return ApiResponse.<List<MediatorResponse>>builder()
                .success(true)
                .status(200)
                .message("Successful")
                .data(mediatorService.search(request))
                .build();
    }

    @PostMapping("/")
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
