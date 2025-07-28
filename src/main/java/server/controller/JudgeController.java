package server.controller;

import jakarta.validation.Valid;
import server.dto.request.JudgeRequest;
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
@RequestMapping("judge")
@Slf4j
public class JudgeController {
    JudgeService judgeService;

    @GetMapping("all")
    public ApiResponse<List<JudgeResponse>> getAll(){
        return ApiResponse.<List<JudgeResponse>>builder()
                .success(true)
                .status(200)
                .message("Successful")
                .data(judgeService.getAll())
                .build();
    }

    @GetMapping("myInfo")
    public ApiResponse<JudgeResponse> getMyInfo(){
        return ApiResponse.<JudgeResponse>builder()
                .success(true)
                .status(200)
                .message("Successful")
                .data(judgeService.getMyInfo())
                .build();
    }
    @PostMapping("")
    public ApiResponse<Void> create(@RequestBody @Valid JudgeRequest request){
        judgeService.create(request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Thêm thẩm phán thành công")
                .build();
    }

}
