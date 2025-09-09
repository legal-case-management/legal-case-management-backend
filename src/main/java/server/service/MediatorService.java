package server.service;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.Synchronized;
import lombok.experimental.FieldDefaults;
import lombok.experimental.NonFinal;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.PageRequest;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import server.dto.request.mediator.MediatorRequest;
import server.dto.request.mediator.MediatorSearchRequest;
import server.dto.response.mediator.MediatorResponse;
import server.entity.Account;
import server.entity.Mediator;
import server.entity.enums.Role;
import server.entity.enums.StatusOfOfficer;
import server.exception.AppException;
import server.exception.ErrorCode;
import server.mapper.MediatorMapper;
import server.repository.MediatorRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class MediatorService {
    MediatorRepository mediatorRepository;

    MediatorMapper mediatorMapper;

    AuthenticationService authenticationService;

    PasswordEncoder passwordEncoder;

    @Value("${auth.default-password}")
    @NonFinal
    String DEFAULT_PASSWORD;

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public List<MediatorResponse> getAll() {
        return mediatorRepository.getAll();
    }

    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public List<MediatorResponse> getLimit(int limit) {
        return mediatorRepository.getLimit(PageRequest.of(0, limit));
    }

    public MediatorResponse getMyInfo() {
        SecurityContext context = SecurityContextHolder.getContext();
        String accountId = context.getAuthentication().getName();

        return mediatorMapper.toMediatorResponse(
                mediatorRepository
                        .findByAccount_AccountId(accountId)
                        .orElseThrow(() -> new AppException(ErrorCode.ACCOUNT_NOT_EXISTED))
        );
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void create(MediatorRequest request) {
        Mediator mediator = mediatorMapper.toMediator(request);

        Integer numberOfId = mediatorRepository.getMaxId()
                .orElse(0);
        String mediatorId = String.format("%s%02d", "HG", numberOfId + 1);
        if (mediatorRepository.existsById(mediatorId)) {
            throw new AppException(ErrorCode.MEDIATOR_EXISTED);
        }

        mediator.setOfficerId(mediatorId);
        mediator.setStatusOfOfficer(StatusOfOfficer.WORKING);
        Mediator mediatorSaved = mediatorRepository.save(mediator);

        Account account = Account.builder()
                .username(mediatorSaved.getOfficerId())
                .email(request.getEmail())
                .password(passwordEncoder.encode(DEFAULT_PASSWORD))
                .officer(mediatorSaved)
                .role(Role.JUDGE)
                .build();

        authenticationService.createAccount(account);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void update(String id, MediatorRequest request) {
        Mediator mediatorSaved = mediatorRepository
                .findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.MEDIATOR_NOT_EXISTED));

        mediatorMapper.updateMediatorFromRequest(request, mediatorSaved);
        mediatorRepository.save(mediatorSaved);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    @Async
    @Synchronized
    @Transactional
    public void delete(String id) {
        Mediator mediatorSaved = mediatorRepository
                .findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.MEDIATOR_NOT_EXISTED));

        mediatorRepository.delete(mediatorSaved);
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
    public List<MediatorResponse> search(MediatorSearchRequest request) {
        return mediatorRepository.search(
                request.getOfficerId(),
                request.getFullName(),
                request.getStatusOfOfficer()
        );
    }
}
