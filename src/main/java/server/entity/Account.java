package server.entity;

import jakarta.persistence.*;
import server.entity.enums.Role;
import lombok.*;
import lombok.experimental.FieldDefaults;

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
    @Column(nullable = false)
    String password;
    @Column(unique = true, nullable = false)
    String email;
    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    Role role;

    @Column(name = "active", nullable = false)
    boolean active;

    @OneToOne(cascade = CascadeType.REMOVE)
    @JoinColumn(name = "officer_id")
    Officer officer;
}
