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
import server.dto.response.handleDecisionType.HandleDecisionTypeResponse;
import server.entity.DecisionType;
import server.entity.HandleDecisionType;
import server.entity.HandleDecisionTypeId;
import server.exception.AppException;
import server.exception.ErrorCode;
import server.mapper.HandleDecisionTypeMapper;
import server.repository.HandleDecisionTypeRepository;
import server.repository.DecisionTypeRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class HandleTypeOfDecisionService {
    HandleDecisionTypeRepository handleDecisionTypeRepository;
    DecisionTypeRepository decisionTypeRepository;

    HandleDecisionTypeMapper handleTypeOfDecisionMapper;

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void create(HandleDecisionTypeRequest request) {
        HandleDecisionType handleTypeOfDecision = HandleDecisionType.builder().build();
        handleTypeOfDecisionMapper.toHandleDecisionType(request, handleTypeOfDecision);

        DecisionType typeOfDecision = decisionTypeRepository.findById(request.getTypeOfDecisionId())
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_DECISION_NOT_EXISTED));

        HandleDecisionTypeId id = HandleDecisionTypeId.builder()
                .typeOfDecision(typeOfDecision)
                .preStatus(request.getPreStatus())
                .build();

        if (handleDecisionTypeRepository.existsById(id)) {
            throw new AppException(ErrorCode.HANDLE_TYPE_OF_DECISION_EXISTED);
        }

        handleTypeOfDecision.setDecisionType(typeOfDecision);
        handleTypeOfDecision.setPreStatus(request.getPreStatus());

        handleDecisionTypeRepository.save(handleTypeOfDecision);
    }



    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void update(HandleDecisionTypeId id, HandleDecisionTypeRequest request) {
        HandleDecisionType handleTypeOfDecision = handleDecisionTypeRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.HANDLE_TYPE_OF_DECISION_NOT_EXISTED));
        handleTypeOfDecisionMapper.toHandleDecisionType(request, handleTypeOfDecision);
        handleDecisionTypeRepository.save(handleTypeOfDecision);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void delete(HandleDecisionTypeId id) {
        HandleDecisionType handleTypeOfDecision = handleDecisionTypeRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.HANDLE_TYPE_OF_DECISION_NOT_EXISTED));
        handleDecisionTypeRepository.delete(handleTypeOfDecision);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    public List<HandleDecisionTypeResponse> getByTypeOfDecision(String typeOfDecisionId) {
        DecisionType typeOfDecision = decisionTypeRepository.findById(typeOfDecisionId)
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_DECISION_NOT_EXISTED));

        return handleDecisionTypeRepository
                .findAllByTypeOfDecision(typeOfDecision)
                .stream().map(handleTypeOfDecisionMapper::toHandleDecisionTypeResponse)
                .toList();
    }
}
