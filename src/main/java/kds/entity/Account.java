package kds.entity;

import jakarta.persistence.*;
import kds.entity.enums.Judge;
import kds.entity.enums.Role;
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
    String username;
    String password;
    Role role;
    @OneToOne
    @JoinColumn(name = "judge_id")
    Judge judge;
}
