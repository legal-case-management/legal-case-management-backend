package server.entity;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.Set;

@Entity
@Table(name = "roles")
@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class Role {
    /* VD: ADMIN
     * Cho phép người dùng nhập, check tất cá phải in hoa và dấu _, không bắt đầu bằng số, không có dấu khoảng trắng*/
    @Id
    @Column(name = "role_id", length = 100)
    String roleId;

    /* VD: Quản trị viên */
    @Column(length = 100)
    String name;

    /* VD: Có vai trò cao nhất, có mọi quyền  */
    @Column(length = 255)
    String description;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "role_permissions",
            joinColumns = @JoinColumn(name = "role_id"),
            inverseJoinColumns = @JoinColumn(name = "permission_id")
    )
    Set<Permission> permissions;
}
