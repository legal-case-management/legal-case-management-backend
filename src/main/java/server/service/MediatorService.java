package server.service;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.Synchronized;
import lombok.experimental.FieldDefaults;
import lombok.experimental.NonFinal;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import server.dto.request.mediator.MediatorRequest;
import server.dto.request.mediator.MediatorSearchRequest;
import server.dto.response.PageResponse;
import server.dto.response.mediator.MediatorResponse;
import server.entity.Account;
import server.entity.Mediator;
import server.entity.enums.Role;
import server.entity.enums.OfficerStatus;
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
        mediator.setStatusOfOfficer(OfficerStatus.WORKING);
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
    public PageResponse<MediatorResponse> search(MediatorSearchRequest request, int page, int size, String sortBy) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(sortBy).ascending());

        Page<MediatorResponse> resultPage = mediatorRepository.search(
                request.getOfficerId(),
                request.getFullName(),
                request.getStatusOfOfficer(),
                pageable
        );

        return PageResponse.<MediatorResponse>builder()
                .number(resultPage.getNumber())
                .size(resultPage.getSize())
                .numberOfElement(resultPage.getNumberOfElements())
                .totalElements(resultPage.getTotalElements())
                .totalPages(resultPage.getTotalPages())
                .hasNext(resultPage.hasNext())
                .hasPrevious(resultPage.hasPrevious())
                .isFirst(resultPage.isFirst())
                .isLast(resultPage.isLast())
                .content(resultPage.getContent())
                .build();
    }

}
