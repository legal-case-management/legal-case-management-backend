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
public class HandleDecisionTypeService {
    HandleDecisionTypeRepository handleDecisionTypeRepository;
    DecisionTypeRepository decisionTypeRepository;

    HandleDecisionTypeMapper handleDecisionTypeMapper;

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void create(HandleDecisionTypeRequest request) {
        HandleDecisionType handleDecisionType = HandleDecisionType.builder().build();
        handleDecisionTypeMapper.toHandleDecisionType(request, handleDecisionType);

        DecisionType decisionType = decisionTypeRepository.findById(request.getDecisionTypeId())
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_DECISION_NOT_EXISTED));

        HandleDecisionTypeId id = HandleDecisionTypeId.builder()
                .decisionType(decisionType)
                .preStatus(request.getPreStatus())
                .build();

        if (handleDecisionTypeRepository.existsById(id)) {
            throw new AppException(ErrorCode.HANDLE_TYPE_OF_DECISION_EXISTED);
        }

        handleDecisionType.setDecisionType(decisionType);
        handleDecisionType.setPreStatus(request.getPreStatus());

        handleDecisionTypeRepository.save(handleDecisionType);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void update(HandleDecisionTypeId id, HandleDecisionTypeRequest request) {
        HandleDecisionType handleDecisionType = handleDecisionTypeRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.HANDLE_TYPE_OF_DECISION_NOT_EXISTED));
        handleDecisionTypeMapper.toHandleDecisionType(request, handleDecisionType);
        handleDecisionTypeRepository.save(handleDecisionType);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void delete(HandleDecisionTypeId id) {
        HandleDecisionType handleDecisionType = handleDecisionTypeRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.HANDLE_TYPE_OF_DECISION_NOT_EXISTED));
        handleDecisionTypeRepository.delete(handleDecisionType);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    public List<HandleDecisionTypeResponse> getByDecisionType(String decisionTypeId) {
        DecisionType decisionType = decisionTypeRepository.findById(decisionTypeId)
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_DECISION_NOT_EXISTED));

        return handleDecisionTypeRepository
                .findAllByDecisionType(decisionType)
                .stream().map(handleDecisionTypeMapper::toHandleDecisionTypeResponse)
                .toList();
    }
}