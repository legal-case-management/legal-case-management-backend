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
import server.dto.request.legalRelationship.LegalRelationshipRequest;
import server.dto.request.legalRelationship.LegalRelationshipSearchRequest;
import server.dto.response.ApiResponse;
import server.dto.response.PageResponse;
import server.dto.response.legalRelationship.LegalRelationshipResponse;
import server.service.LegalRelationshipService;

import java.util.List;

@RestController
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequestMapping("/legal-relationship")
@Slf4j
public class LegalRelationshipController {
    LegalRelationshipService legalRelationshipService;

    @GetMapping("/all")
    public ApiResponse<List<LegalRelationshipResponse>> getAll() {
        return ApiResponse.<List<LegalRelationshipResponse>>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(legalRelationshipService.getAll())
                .build();
    }

    @PostMapping("/search")
    public ApiResponse<PageResponse<LegalRelationshipResponse>> search(
            @RequestBody @Valid LegalRelationshipSearchRequest request,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "legalRelationshipId") String sortBy
    ) {

        return ApiResponse.<PageResponse<LegalRelationshipResponse>>builder()
                .success(true)
                .status(200)
                .message("Thành công")
                .data(legalRelationshipService.search(request, page, size, sortBy))
                .build();
    }


    @PostMapping
    public ApiResponse<Void> create(@RequestBody @Valid LegalRelationshipRequest request) {
        legalRelationshipService.create(request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Tạo quan hệ pháp luật thành công")
                .build();
    }

    @PutMapping("/{id}")
    public ApiResponse<Void> update(@PathVariable String id, @RequestBody @Valid LegalRelationshipRequest request) {
        legalRelationshipService.update(id, request);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Cập nhật quan hệ pháp luật thành công")
                .build();
    }

    @DeleteMapping("/{id}")
    public ApiResponse<Void> delete(@PathVariable String id) {
        legalRelationshipService.delete(id);
        return ApiResponse.<Void>builder()
                .success(true)
                .status(200)
                .message("Xoá quan hệ pháp luật thành công")
                .build();
    }
}
