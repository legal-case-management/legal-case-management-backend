package server.controller;

import jakarta.validation.Valid;
import server.dto.request.JudgeRequest;
import server.dto.request.JudgeSearchRequest;
import server.dto.response.ApiResponse;
import server.dto.response.JudgeResponse;
import server.service.JudgeService;
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
    public ApiResponse<List<JudgeResponse>> getAll(){
        return ApiResponse.<List<JudgeResponse>>builder()
                .success(true)
                .status(200)
                .message("Successful")
                .data(judgeService.getAll())
                .build();
    }

    @GetMapping("/list-50")
    public ApiResponse<List<JudgeResponse>> get50Judge(){
        return ApiResponse.<List<JudgeResponse>>builder()
                .success(true)
                .status(200)
                .message("Successful")
                .data(judgeService.get50Judge())
                .build();
    }

    @PostMapping("/search")
    public ApiResponse<List<JudgeResponse>> search(@RequestBody @Valid JudgeSearchRequest request){
        return ApiResponse.<List<JudgeResponse>>builder()
                .success(true)
                .status(200)
                .message("Successful")
                .data(judgeService.search(request))
                .build();
    }

    @GetMapping("/myInfo")
    public ApiResponse<JudgeResponse> getMyInfo(){
        return ApiResponse.<JudgeResponse>builder()
                .success(true)
                .status(200)
                .message("Successful")
                .data(judgeService.getMyInfo())
                .build();
    }
    @PostMapping("/")
    public ApiResponse<Void> create(@RequestBody @Valid JudgeRequest request){
        judgeService.create(request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Thêm thẩm phán thành công")
                .build();
    }

    @PutMapping("/")
    public ApiResponse<Void> update(@RequestBody @Valid JudgeRequest request){
        judgeService.update(request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Cập nhật thẩm phán thành công")
                .build();
    }

    @DeleteMapping("/")
    public ApiResponse<Void> delete(@RequestBody @Valid  JudgeRequest request){
        judgeService.delete(request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Xoá thẩm phán thành công")
                .build();
    }
}
