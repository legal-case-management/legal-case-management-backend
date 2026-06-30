package server.config;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.boot.ApplicationRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;
import server.constant.PermissionCatalog;
import server.constant.RoleCatalog;
import server.entity.Account;
import server.entity.Permission;
import server.entity.Role;
import server.repository.AccountRepository;
import server.repository.PermissionRepository;
import server.repository.RoleRepository;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Configuration
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ApplicationInitConfig {
    PasswordEncoder passwordEncoder;

    @Bean
    ApplicationRunner applicationRunner(
            AccountRepository accountRepository,
            RoleRepository roleRepository,
            PermissionRepository permissionRepository
    ) {
        return args -> {
            seedAdminAccount(accountRepository, roleRepository);
        };
    }

    private Set<Permission> resolvePermissions(Set<String> permissionIds, List<Permission> allPermissions) {
        return allPermissions.stream()
                .filter(p -> permissionIds.contains(p.getPermissionId()))
                .collect(Collectors.toSet());
    }

    private void seedAdminAccount(AccountRepository accountRepository, RoleRepository roleRepository) {
        if (accountRepository.findAccountByUsername("admin").isEmpty()) {
            Role adminRole = roleRepository.findById(RoleCatalog.ADMIN).orElseThrow();
            Account account = Account
                    .builder()
                    .username("admin")
                    .email("daophuckhang090@gmail.com")
                    .password(passwordEncoder.encode("admin"))
                    .role(adminRole)
                    .active(true)
                    .build();
            accountRepository.save(account);
        }
    }
}
