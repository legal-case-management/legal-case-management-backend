package com.qlatakv9dt.service;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.Synchronized;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.qlatakv9dt.dto.request.batch.BatchRequest;
import com.qlatakv9dt.dto.request.batch.BatchSearchRequest;
import com.qlatakv9dt.dto.response.PageResponse;
import com.qlatakv9dt.dto.response.batch.BatchResponse;
import com.qlatakv9dt.entity.Batch;
import com.qlatakv9dt.exception.AppException;
import com.qlatakv9dt.exception.ErrorCode;
import com.qlatakv9dt.mapper.BatchMapper;
import com.qlatakv9dt.mapper.PageMapper;
import com.qlatakv9dt.repository.BatchRepository;
import com.qlatakv9dt.repository.LegalCaseRepository;
import com.qlatakv9dt.utils.DateUtils;

import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class BatchService {
    BatchRepository batchRepository;
    LegalCaseRepository legalCaseRepository;

    BatchMapper batchMapper;
    PageMapper pageMapper;

    @PreAuthorize("hasAuthority('CREATE_BATCH')")
    @Synchronized
    @Transactional
    public void create(BatchRequest request) {
        Batch batch = Batch.builder().build();
        batchMapper.toBatch(request, batch);
        batch.setStorageDate(LocalDateTime.now());

        Integer judgeNumberOfId = batchRepository.getMaxId(String.format("%4d", DateUtils.getCurrentYear(batch.getStorageDate())))
                .orElse(0);
        String batchId = String.format("%4d%s%03d", DateUtils.getCurrentYear(batch.getStorageDate()), "D", judgeNumberOfId + 1);
        if (batchRepository.existsById(batchId)) {
            throw new AppException(ErrorCode.BATCH_EXISTED);
        }

        batch.setBatchId(batchId);
        batchRepository.save(batch);
    }

    @PreAuthorize("hasAuthority('UPDATE_BATCH')")
    @Async
    @Synchronized
    @Transactional
    public void update(String id, BatchRequest request) {
        Batch existing = batchRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.BATCH_NOT_EXISTED));
        batchMapper.toBatch(request, existing);
        batchRepository.save(existing);
    }

    @PreAuthorize("hasAuthority('DELETE_BATCH')")
    @Async
    @Synchronized
    @Transactional
    public void delete(String id) {
        Batch existing = batchRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.BATCH_NOT_EXISTED));

        long legalCaseCount = legalCaseRepository.countLegalCaseByBatch(existing);
        if(legalCaseCount > 0) {
            throw new AppException(ErrorCode.BATCH_CANNOT_BE_DELETED);
        }

        batchRepository.delete(existing);
    }

    @PreAuthorize("hasAuthority('VIEW_BATCH')")
    public PageResponse<BatchResponse> search(BatchSearchRequest request, int page, int size, String sortBy) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(sortBy).ascending());
        Page<BatchResponse> resultPage = batchRepository.search(
                request.getBatchId(),
                request.getBatchName(),
                request.getNote(),
                request.getStartStorageDate(),
                request.getEndStorageDate(),
                pageable
        ).map(batchMapper::toBatchResponse);

        return pageMapper.map(resultPage);
    }

    public List<BatchResponse> getAll() {
        return batchRepository.findAll(Sort.by("batchId"))
                .stream()
                .map(batchMapper::toBatchResponseBasic)
                .toList();
    }
}