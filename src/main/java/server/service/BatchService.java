package server.service;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.Synchronized;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.PageRequest;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import server.dto.request.batch.BatchRequest;
import server.dto.request.batch.BatchSearchRequest;
import server.dto.response.batch.BatchResponse;
import server.entity.Batch;
import server.exception.AppException;
import server.exception.ErrorCode;
import server.mapper.BatchMapper;
import server.repository.BatchRepository;

import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class BatchService {
    BatchRepository batchRepository;

    BatchMapper batchMapper;

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    @Synchronized
    @Transactional
    public Batch create(BatchRequest request) {
        Batch batch = Batch.builder().build();
        batchMapper.updateBatchFromRequest(request, batch);
        batch.setStorageDate(LocalDateTime.now());

        Integer judgeNumberOfId = batchRepository.getMaxId(String.format("%4d", batch.getStorageDate().getYear()))
                .orElse(0);
        String batchId = String.format("%4d%s%02d", batch.getStorageDate().getYear(), "D", judgeNumberOfId + 1);
        if (batchRepository.existsById(batchId)) {
            throw new AppException(ErrorCode.BATCH_EXISTED);
        }

        batch.setBatchId(batchId);
       return batchRepository.save(batch);
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    @Async
    @Synchronized
    @Transactional
    public void update(String id, BatchRequest request) {
        Batch existing = batchRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.BATCH_NOT_EXISTED));
        batchMapper.updateBatchFromRequest(request, existing);
        batchRepository.save(existing);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void delete(String id) {
        Batch existing = batchRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.BATCH_NOT_EXISTED));
        batchRepository.delete(existing);
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public List<BatchResponse> getTop50() {
        return batchRepository
                .getTop50(PageRequest.of(0, 50))
                .stream().map(batchMapper::toBatchResponse)
                .toList();
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public List<BatchResponse> getAll() {
        return batchRepository
                .findAll()
                .stream().map(batchMapper::toBatchResponse)
                .toList();
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public List<BatchResponse> search(BatchSearchRequest request) {
        return batchRepository
                .search(
                        request.getBatchId(),
                        request.getBatchName(),
                        request.getNote(),
                        request.getStorageDateStart(),
                        request.getStorageDateEnd()
                )
                .stream().map(batchMapper::toBatchResponse)
                .toList();
    }
}
