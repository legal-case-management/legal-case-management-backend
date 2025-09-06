package server.controller;

import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import server.dto.request.legalCase.*;
import server.dto.response.ApiResponse;
import server.dto.response.legalCase.LegalCaseResponse;
import server.service.LegalCaseService;

import java.util.List;

@RestController
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequestMapping("/legal-case")
@Slf4j
public class LegalCaseController {
    LegalCaseService legalCaseService;
    @GetMapping("/all")
    public ApiResponse<List<LegalCaseResponse>> getAll(){
        return ApiResponse.<List<LegalCaseResponse>>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(legalCaseService.getAll())
                .build();
    }

    @GetMapping("/limit-{limit}")
    public ApiResponse<List<LegalCaseResponse>> getLimit(@PathVariable int limit){
        return ApiResponse.<List<LegalCaseResponse>>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(legalCaseService.getLimit(limit))
                .build();
    }

    @PostMapping("/search")
    public ApiResponse<List<LegalCaseResponse>> search(@RequestBody @Valid LegalCaseSearchRequest request){
        return ApiResponse.<List<LegalCaseResponse>>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(legalCaseService.search(request))
                .build();
    }

    @PostMapping("/")
    public ApiResponse<Void> create(@RequestBody @Valid LegalCaseRequest request){
        legalCaseService.create(request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Thêm án thành công")
                .build();
    }

    @PostMapping("/import-excel")
    public ApiResponse<Void> importFromExcel(@RequestBody @Valid LegalCasesRequest request){
        legalCaseService.importFromExcel(request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Thêm án thành công")
                .build();
    }

    @PutMapping("/{id}")
    public ApiResponse<Void> update(@PathVariable String id, @RequestBody @Valid LegalCaseRequest request){
        legalCaseService.update(id, request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Cập nhật án thành công")
                .build();
    }

    @DeleteMapping("/{id}")
    public ApiResponse<Void> delete(@PathVariable String id){
        legalCaseService.delete(id);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Xóa án thành công")
                .build();
    }

    @PostMapping("/random-assignment")
    public ApiResponse<List<LegalCaseResponse>> randomAssignment(@RequestBody @Valid RandomAssignmentRequest request) {
        return ApiResponse.<List<LegalCaseResponse>>builder()
                .success(true)
                .status(200)
                .message("Phân công án ngẫu nhiên thành công")
                .data(legalCaseService.randomAssignment(request))
                .build();
    }

    @PostMapping("/assign-assignment")
    public ApiResponse<Void> assignAssignment(@RequestBody @Valid AssignAssignmentRequest request) {
        legalCaseService.assignAssignment(request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Phân công án chỉ định thành công")
                .build();
    }

    @PostMapping("/list-waiting-for-assignment")
    public ApiResponse<List<LegalCaseResponse>> getAssignAssignmentByLegalRelationshipGroup(@RequestBody @Valid LegalCaseSearchRequest request){
        return ApiResponse.<List<LegalCaseResponse>>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(legalCaseService.getAssignAssignmentByLegalRelationshipGroup(request))
                .build();
    }

}
