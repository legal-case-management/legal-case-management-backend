package server.controller;

import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import server.dto.request.handleDecisionType.HandleDecisionTypeRequest;
import server.dto.response.ApiResponse;
import server.dto.response.handleDecisionType.HandleDecisionTypeResponse;
import server.entity.DecisionType;
import server.entity.HandleDecisionType.HandleDecisionTypeId;
import server.entity.enums.LegalCaseStatus;
import server.service.HandleDecisionTypeService;

import java.util.List;

@RestController
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequestMapping("/handle-decision-type")
@Slf4j
public class HandleDecisionTypeController {
    HandleDecisionTypeService handleDecisionTypeService;

    @PutMapping("/{decisionTypeId}/{preLegalCaseStatus}")
    public ApiResponse<Void> update(
            @PathVariable String decisionTypeId,
            @PathVariable LegalCaseStatus preLegalCaseStatus,
            @RequestBody @Valid HandleDecisionTypeRequest request
    ) {
        HandleDecisionTypeId id = HandleDecisionTypeId.builder()
                .decisionType(DecisionType.builder().decisionTypeId(decisionTypeId).build())
                .preStatus(preLegalCaseStatus)
                .build();

        handleDecisionTypeService.update(id, request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Cập nhật xử lý loại quyết định, thông báo thành công")
                .build();
    }

    @GetMapping("/by-type-of-decision/{typeOfDecisionId}")
    public ApiResponse<List<HandleDecisionTypeResponse>> getByTypeOfDecision(@PathVariable String typeOfDecisionId) {
        List<HandleDecisionTypeResponse> handleDecisionTypeResponses = handleDecisionTypeService.getByDecisionType(typeOfDecisionId);
        System.out.println("Hello");
        handleDecisionTypeResponses.forEach(e -> System.out.println(e.isActive()));
        return ApiResponse.<List<HandleDecisionTypeResponse>>builder()
                .success(true)
                .status(200)
                .message("Tìm kiếm thành công")
                .data(handleDecisionTypeService.getByDecisionType(typeOfDecisionId))
                .build();
    }

    @PatchMapping("/block/{decisionTypeId}/{preLegalCaseStatus}")
    public ApiResponse<Void> block(
            @PathVariable String decisionTypeId,
            @PathVariable LegalCaseStatus preLegalCaseStatus
    ) {
        HandleDecisionTypeId id = HandleDecisionTypeId.builder()
                .decisionType(DecisionType.builder().decisionTypeId(decisionTypeId).build())
                .preStatus(preLegalCaseStatus)
                .build();
        handleDecisionTypeService.blockHandleDecisionType(id);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .build();
    }

    @PatchMapping("/active/{decisionTypeId}/{preLegalCaseStatus}")
    public ApiResponse<Void> active(
            @PathVariable String decisionTypeId,
            @PathVariable LegalCaseStatus preLegalCaseStatus
    ) {
        HandleDecisionTypeId id = HandleDecisionTypeId.builder()
                .decisionType(DecisionType.builder().decisionTypeId(decisionTypeId).build())
                .preStatus(preLegalCaseStatus)
                .build();
        handleDecisionTypeService.activeHandleDecisionType(id);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .build();
    }

}
