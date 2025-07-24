package server.controller;

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
    JudgeService customerService;

    @GetMapping("all")
    public ApiResponse<List<JudgeResponse>> createCustomerAccount(){
        return ApiResponse.<List<JudgeResponse>>builder()
                .success(true)
                .status(200)
                .message("Successful")
                .data(customerService.getAll())
                .build();
    }

    @GetMapping("myInfo")
    public ApiResponse<JudgeResponse> getMyInfo(){
        return ApiResponse.<JudgeResponse>builder()
                .success(true)
                .status(200)
                .message("Successful")
                .data(customerService.getMyInfo())
                .build();
    }
}
