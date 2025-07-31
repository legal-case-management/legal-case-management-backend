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
    String password;
    String email;
    Role role;
    @OneToOne
    @JoinColumn(name = "judge_id")
    Judge judge;
}
