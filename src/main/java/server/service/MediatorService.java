package server.service;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.experimental.NonFinal;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import server.dto.response.mediator.MediatorResponse;
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
    public List<MediatorResponse> getAll(){
        return mediatorRepository
                .findAll()
                .stream()
                .map(mediatorMapper::toMediatorResponse)
                .toList();
    }


}
