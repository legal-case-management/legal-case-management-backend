package server.controller;

import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import server.dto.request.handleTypeOfDecision.HandleTypeOfDecisionRequest;
import server.dto.response.ApiResponse;
import server.dto.response.handleTypeOfDecision.HandleTypeOfDecisionResponse;
import server.entity.HandleTypeOfDecisionId;
import server.entity.TypeOfDecision;
import server.entity.enums.StatusOfLegalCase;
import server.service.HandleTypeOfDecisionService;

import java.util.List;

@RestController
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequestMapping("/handle-type-of-decision")
@Slf4j
public class HandleTypeOfDecisionController {
    HandleTypeOfDecisionService handleTypeOfDecisionService;

    @PostMapping("/")
    public ApiResponse<Void> create(@RequestBody @Valid HandleTypeOfDecisionRequest request) {
        handleTypeOfDecisionService.create(request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Thêm loại xử lý loại quyết định, thông báo thành công")
                .build();
    }

    @PutMapping("/{typeOfDecisionId}/{preStatusOfLegalCase}")
    public ApiResponse<Void> update(
            @PathVariable String typeOfDecisionId,
            @PathVariable StatusOfLegalCase preStatusOfLegalCase,
            @RequestBody @Valid HandleTypeOfDecisionRequest request
    ) {
        HandleTypeOfDecisionId id = HandleTypeOfDecisionId.builder()
                .typeOfDecision(TypeOfDecision.builder().typeOfDecisionId(typeOfDecisionId).build())
                .preStatus(preStatusOfLegalCase)
                .build();

        handleTypeOfDecisionService.update(id, request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Cập nhật xử lý loại quyết định, thông báo thành công")
                .build();
    }

    @DeleteMapping("/{typeOfDecisionId}/{preStatusOfLegalCase}")
    public ApiResponse<Void> delete(
            @PathVariable String typeOfDecisionId,
            @PathVariable StatusOfLegalCase preStatusOfLegalCase
    ) {
        HandleTypeOfDecisionId id = HandleTypeOfDecisionId.builder()
                .typeOfDecision(TypeOfDecision.builder().typeOfDecisionId(typeOfDecisionId).build())
                .preStatus(preStatusOfLegalCase)
                .build();
        handleTypeOfDecisionService.delete(id);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Xóa loại xử lý loại quyết định, thông báo thành công")
                .build();
    }

    @GetMapping("/by-type-of-decision/{typeOfDecisionId}")
    public ApiResponse<List<HandleTypeOfDecisionResponse>> getByTypeOfDecision(@PathVariable String typeOfDecisionId){
        return ApiResponse.<List<HandleTypeOfDecisionResponse>>builder()
                .success(true)
                .status(200)
                .message("Tìm kiếm thành công")
                .data(handleTypeOfDecisionService.getByTypeOfDecision(typeOfDecisionId))
                .build();
    }
}
