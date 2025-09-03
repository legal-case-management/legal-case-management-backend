package server.service;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.Synchronized;
import lombok.experimental.FieldDefaults;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import server.dto.request.handleTypeOfDecision.HandleTypeOfDecisionRequest;
import server.dto.request.typeOfDecision.TypeOfDecisionRequest;
import server.dto.response.handleTypeOfDecision.HandleTypeOfDecisionResponse;
import server.dto.response.typeOfDecision.TypeOfDecisionResponse;
import server.entity.HandleTypeOfDecision;
import server.entity.HandleTypeOfDecisionId;
import server.entity.TypeOfDecision;
import server.entity.TypeOfLegalCase;
import server.exception.AppException;
import server.exception.ErrorCode;
import server.mapper.HandleTypeOfDecisionMapper;
import server.repository.HandleTypeOfDecisionRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class HandleTypeOfDecisionService {
    HandleTypeOfDecisionRepository handleTypeOfDecisionRepository;

    HandleTypeOfDecisionMapper handleTypeOfDecisionMapper;

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void create(HandleTypeOfDecisionRequest request) {
        HandleTypeOfDecision handleTypeOfDecision = HandleTypeOfDecision.builder().build();
        handleTypeOfDecisionMapper.toHandleTypeOfDecision(request, handleTypeOfDecision);

        HandleTypeOfDecisionId id = HandleTypeOfDecisionId.builder()
                .typeOfDecision(TypeOfDecision.builder().typeOfDecisionId(request.getTypeOfDecisionId()).build())
                .preStatus(request.getPreStatus())
                .build();

        if(handleTypeOfDecisionRepository.existsById(id)) {
            throw new AppException(ErrorCode.HANDLE_TYPE_OF_DECISION_EXISTED);
        }

        handleTypeOfDecision.setTypeOfDecision(id.getTypeOfDecision());
        handleTypeOfDecision.setPreStatus(id.getPreStatus());

        handleTypeOfDecisionRepository.save(handleTypeOfDecision);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void update(HandleTypeOfDecisionId id, HandleTypeOfDecisionRequest request) {
        HandleTypeOfDecision handleTypeOfDecision = handleTypeOfDecisionRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.HANDLE_TYPE_OF_DECISION_NOT_EXISTED));
        handleTypeOfDecisionMapper.toHandleTypeOfDecision(request, handleTypeOfDecision);
        handleTypeOfDecisionRepository.save(handleTypeOfDecision);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void delete(HandleTypeOfDecisionId id) {
        HandleTypeOfDecision handleTypeOfDecision = handleTypeOfDecisionRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.HANDLE_TYPE_OF_DECISION_NOT_EXISTED));
        handleTypeOfDecisionRepository.delete(handleTypeOfDecision);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    public List<HandleTypeOfDecisionResponse> getAllByTypeOfDecision(TypeOfDecision typeOfDecision) {
        return handleTypeOfDecisionRepository
                .findAllByTypeOfDecision(typeOfDecision)
                .stream().map(handleTypeOfDecisionMapper::toHandleTypeOfDecisionResponse)
                .toList();
    }
}
