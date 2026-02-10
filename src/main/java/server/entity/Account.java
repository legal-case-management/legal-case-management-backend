package server.entity;

import jakarta.persistence.*;
import server.entity.enums.Role;
import lombok.*;
import lombok.experimental.FieldDefaults;
import server.entity.enums.AccountStatus;

@Entity
@Table(name = "accounts")
@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class Account {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "account_id")
    String accountId;
    @Column(unique = true, nullable = false)
    String username;
    String password;
    @Column(unique = true, nullable = false)
    String email;
    @Enumerated(EnumType.STRING)
    Role role;

    @Enumerated(EnumType.STRING)
    @Column(name = "account_status", nullable = false)
    AccountStatus accountStatus;

    @OneToOne(cascade = CascadeType.REMOVE)
    @JoinColumn(name = "officer_id")
    Officer officer;
}
