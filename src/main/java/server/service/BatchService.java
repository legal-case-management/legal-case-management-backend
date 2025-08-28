package server.service;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import server.dto.request.batch.BatchRequest;
import server.dto.request.judge.JudgeRequest;
import server.entity.Account;
import server.entity.Batch;
import server.entity.Judge;
import server.entity.enums.StatusOfJudge;
import server.exception.AppException;
import server.exception.ErrorCode;
import server.mapper.BatchMapper;
import server.repository.BatchRepository;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class BatchService {
    BatchRepository batchRepository;

    BatchMapper batchMapper;

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    @Async
    @Transactional
    public void create(BatchRequest request) {
        Batch batch = Batch.builder().build();


    }
}
