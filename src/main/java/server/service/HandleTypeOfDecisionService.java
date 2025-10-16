package server.service;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.Synchronized;
import lombok.experimental.FieldDefaults;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import server.dto.request.handleDecisionType.HandleDecisionTypeRequest;
import server.dto.response.handleTypeOfDecision.HandleTypeOfDecisionResponse;
import server.entity.DecisionType;
import server.entity.HandleDecisionType;
import server.entity.HandleDecisionTypeId;
import server.exception.AppException;
import server.exception.ErrorCode;
import server.mapper.HandleTypeOfDecisionMapper;
import server.repository.HandleTypeOfDecisionRepository;
import server.repository.TypeOfDecisionRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class HandleTypeOfDecisionService {
    HandleTypeOfDecisionRepository handleTypeOfDecisionRepository;
    TypeOfDecisionRepository typeOfDecisionRepository;

    HandleTypeOfDecisionMapper handleTypeOfDecisionMapper;

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void create(HandleDecisionTypeRequest request) {
        HandleDecisionType handleTypeOfDecision = HandleDecisionType.builder().build();
        handleTypeOfDecisionMapper.toHandleTypeOfDecision(request, handleTypeOfDecision);

        DecisionType typeOfDecision = typeOfDecisionRepository.findById(request.getTypeOfDecisionId())
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_DECISION_NOT_EXISTED));

        HandleDecisionTypeId id = HandleDecisionTypeId.builder()
                .typeOfDecision(typeOfDecision)
                .preStatus(request.getPreStatus())
                .build();

        if (handleTypeOfDecisionRepository.existsById(id)) {
            throw new AppException(ErrorCode.HANDLE_TYPE_OF_DECISION_EXISTED);
        }

        handleTypeOfDecision.setDecisionType(typeOfDecision);
        handleTypeOfDecision.setPreStatus(request.getPreStatus());

        handleTypeOfDecisionRepository.save(handleTypeOfDecision);
    }



    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void update(HandleDecisionTypeId id, HandleDecisionTypeRequest request) {
        HandleDecisionType handleTypeOfDecision = handleTypeOfDecisionRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.HANDLE_TYPE_OF_DECISION_NOT_EXISTED));
        handleTypeOfDecisionMapper.toHandleTypeOfDecision(request, handleTypeOfDecision);
        handleTypeOfDecisionRepository.save(handleTypeOfDecision);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void delete(HandleDecisionTypeId id) {
        HandleDecisionType handleTypeOfDecision = handleTypeOfDecisionRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.HANDLE_TYPE_OF_DECISION_NOT_EXISTED));
        handleTypeOfDecisionRepository.delete(handleTypeOfDecision);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    public List<HandleTypeOfDecisionResponse> getByTypeOfDecision(String typeOfDecisionId) {
        DecisionType typeOfDecision = typeOfDecisionRepository.findById(typeOfDecisionId)
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_DECISION_NOT_EXISTED));

        return handleTypeOfDecisionRepository
                .findAllByTypeOfDecision(typeOfDecision)
                .stream().map(handleTypeOfDecisionMapper::toHandleTypeOfDecisionResponse)
                .toList();
    }
}
