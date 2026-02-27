package server.service;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.Synchronized;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.Sort;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import server.dto.request.handleDecisionType.HandleDecisionTypeRequest;
import server.dto.response.handleDecisionType.HandleDecisionTypeResponse;
import server.entity.Account;
import server.entity.DecisionType;
import server.entity.HandleDecisionType;
import server.entity.HandleDecisionType.HandleDecisionTypeId;
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
    public void update(HandleDecisionTypeId id, HandleDecisionTypeRequest request) {
        HandleDecisionType handleDecisionType = handleDecisionTypeRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.HANDLE_TYPE_OF_DECISION_NOT_EXISTED));
        handleDecisionTypeMapper.toHandleDecisionType(request, handleDecisionType);
        handleDecisionTypeRepository.save(handleDecisionType);
    }


    @PreAuthorize("hasAnyRole('ADMIN')")
    public List<HandleDecisionTypeResponse> getByDecisionType(String decisionTypeId) {
        DecisionType decisionType = decisionTypeRepository.findById(decisionTypeId)
                .orElseThrow(() -> new AppException(ErrorCode.TYPE_OF_DECISION_NOT_EXISTED));

        System.out.println("hello2");
        List<HandleDecisionType> a = handleDecisionTypeRepository
                .findAllByDecisionType(decisionType, Sort.by(Sort.Direction.ASC, "preStatus"));
        a.forEach(e -> System.out.println(e.isActive()));

        return handleDecisionTypeRepository
                .findAllByDecisionType(decisionType,  Sort.by(Sort.Direction.ASC, "preStatus"))
                .stream()
                .map(handleDecisionTypeMapper::toHandleDecisionTypeResponse)
                .toList();
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    public void blockHandleDecisionType(HandleDecisionTypeId id) {
        HandleDecisionType handleDecisionType = handleDecisionTypeRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.HANDLE_TYPE_OF_DECISION_NOT_EXISTED));

        handleDecisionType.setActive(false);
        handleDecisionTypeRepository.save(handleDecisionType);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    public void activeHandleDecisionType(HandleDecisionTypeId id) {
        HandleDecisionType handleDecisionType = handleDecisionTypeRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.HANDLE_TYPE_OF_DECISION_NOT_EXISTED));

        handleDecisionType.setActive(true);
        handleDecisionTypeRepository.save(handleDecisionType);
    }
}