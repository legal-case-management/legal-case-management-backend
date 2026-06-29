package server.config;

import server.entity.Account;
import server.enums.Role;
import server.repository.AccountRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.boot.ApplicationRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ApplicationInitConfig {
    PasswordEncoder passwordEncoder;

    @Bean
    ApplicationRunner applicationRunner(
            AccountRepository accountRepository
    ) {
        return args -> {
            if (accountRepository.findAccountByUsername(("admin")).isEmpty()) {

                Account account = Account
                        .builder()
                        .username("admin")
                        .email("daophuckhang090@gmail.com")
                        .password(passwordEncoder.encode("admin"))
                        .role(Role.ADMIN)
                        .active(true)
                        .build();
                accountRepository.save(account);
            }
        };
    }
}
