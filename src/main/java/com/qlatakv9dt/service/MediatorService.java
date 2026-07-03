package com.qlatakv9dt.service;

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
import com.qlatakv9dt.dto.request.mediator.MediatorRequest;
import com.qlatakv9dt.dto.request.mediator.MediatorSearchRequest;
import com.qlatakv9dt.dto.response.PageResponse;
import com.qlatakv9dt.dto.response.mediator.MediatorResponse;
import com.qlatakv9dt.constant.RoleCatalog;
import com.qlatakv9dt.entity.Account;
import com.qlatakv9dt.entity.Mediator;
import com.qlatakv9dt.entity.Role;
import com.qlatakv9dt.enums.OfficerStatus;
import com.qlatakv9dt.exception.AppException;
import com.qlatakv9dt.exception.ErrorCode;
import com.qlatakv9dt.mapper.MediatorMapper;
import com.qlatakv9dt.mapper.PageMapper;
import com.qlatakv9dt.repository.LegalCaseRepository;
import com.qlatakv9dt.repository.MediatorRepository;
import com.qlatakv9dt.repository.RoleRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class MediatorService {
    MediatorRepository mediatorRepository;
    LegalCaseRepository legalCaseRepository;
    RoleRepository roleRepository;

    MediatorMapper mediatorMapper;
    PageMapper pageMapper;

    AuthenticationService authenticationService;

    PasswordEncoder passwordEncoder;

    @Value("${auth.default-password}")
    @NonFinal
    String DEFAULT_PASSWORD;

    @PreAuthorize("hasAuthority('VIEW_MEDIATOR')")
    public List<MediatorResponse> getAll() {
        return mediatorRepository.findAll().stream()
                .map(mediatorMapper::toMediatorResponseBasic)
                .toList();
    }


    @PreAuthorize("hasAuthority('CREATE_MEDIATOR')")
    @Synchronized
    @Transactional
    public void create(MediatorRequest request) {
        Mediator mediator = mediatorMapper.toMediator(request);

        Integer numberId = mediatorRepository.getMaxId()
                .orElse(0);
        String mediatorId = String.format("%s%02d", "HG", numberId + 1);
        if (mediatorRepository.existsById(mediatorId)) {
            throw new AppException(ErrorCode.MEDIATOR_EXISTED);
        }

        mediator.setOfficerId(mediatorId);
        mediator.setOfficerStatus(OfficerStatus.WORKING);
        Mediator mediatorSaved = mediatorRepository.save(mediator);

        Role mediatorRole = roleRepository.findById(RoleCatalog.MEDIATOR)
                .orElseThrow(() -> new AppException(ErrorCode.ROLE_NOT_EXISTED));

        Account account = Account.builder()
                .username(mediatorSaved.getOfficerId())
                .email(request.getEmail())
                .password(passwordEncoder.encode(DEFAULT_PASSWORD))
                .officer(mediatorSaved)
                .role(mediatorRole)
                .build();

        authenticationService.createAccount(account);
    }

    @PreAuthorize("hasAuthority('UPDATE_MEDIATOR')")
    @Synchronized
    @Transactional
    public void update(String id, MediatorRequest request) {
        Mediator mediatorSaved = mediatorRepository
                .findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.MEDIATOR_NOT_EXISTED));

        mediatorMapper.toMediator(request, mediatorSaved);
        mediatorRepository.save(mediatorSaved);
    }

    @PreAuthorize("hasAuthority('DELETE_MEDIATOR')")
    @Synchronized
    @Transactional
    public void delete(String id) {
        Mediator mediatorSaved = mediatorRepository
                .findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.MEDIATOR_NOT_EXISTED));

        long numberLegalCase = legalCaseRepository.countLegalCasesByMediator(mediatorSaved);
        if (numberLegalCase > 0) {
            throw new AppException(ErrorCode.MEDIATOR_ASSIGNED_TO_LEGAL_CASE);
        }

        mediatorRepository.delete(mediatorSaved);
    }

    @PreAuthorize("hasAuthority('VIEW_MEDIATOR')")
    public PageResponse<MediatorResponse> search(MediatorSearchRequest request, int page, int size, String sortBy) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(sortBy).ascending());

        Page<MediatorResponse> resultPage = mediatorRepository.search(
                request.getOfficerId(),
                request.getFullName(),
                request.getOfficerStatus(),
                pageable
        ).map(mediatorMapper::toMediatorResponse);

        return pageMapper.map(resultPage);
    }
}
