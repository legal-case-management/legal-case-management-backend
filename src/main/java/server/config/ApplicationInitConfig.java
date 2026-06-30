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
            seedPermissions(permissionRepository);
            seedRoles(roleRepository, permissionRepository);
            seedAdminAccount(accountRepository, roleRepository);
        };
    }

    /** Upsert toàn bộ permission từ catalogue (idempotent: cập nhật name/description nếu đã tồn tại). */
    private void seedPermissions(PermissionRepository permissionRepository) {
        for (Map.Entry<String, String[]> entry : PermissionCatalog.ALL.entrySet()) {
            String permissionId = entry.getKey();
            String[] meta = entry.getValue();

            Permission permission = permissionRepository.findById(permissionId)
                    .orElseGet(() -> Permission.builder().permissionId(permissionId).build());
            permission.setName(meta[0]);
            permission.setDescription(meta[1]);
            permissionRepository.save(permission);
        }
    }

    /**
     * Tạo 4 vai trò mặc định nếu chưa có.
     * Riêng ADMIN luôn được đồng bộ để có TẤT CẢ permission (kể cả quyền mới thêm sau này).
     */
    private void seedRoles(RoleRepository roleRepository, PermissionRepository permissionRepository) {
        List<Permission> allPermissions = permissionRepository.findAll();

        for (RoleCatalog.DefaultRole def : RoleCatalog.DEFAULTS) {
            boolean isAdmin = RoleCatalog.ADMIN.equals(def.roleId());
            Role existing = roleRepository.findById(def.roleId()).orElse(null);

            if (existing == null) {
                Role role = Role.builder()
                        .roleId(def.roleId())
                        .name(def.name())
                        .description(def.description())
                        .permissions(resolvePermissions(def.permissionIds(), allPermissions))
                        .build();
                roleRepository.save(role);
            } else if (isAdmin) {
                // ADMIN luôn có mọi quyền -> đồng bộ lại mỗi lần khởi động.
                existing.setPermissions(new HashSet<>(allPermissions));
                roleRepository.save(existing);
            }
        }
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
