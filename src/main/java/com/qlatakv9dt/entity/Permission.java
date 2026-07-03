package com.qlatakv9dt.entity;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Entity
@Table(name = "permissions")
@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class Permission {
    /* VD: CREATE_LEGAL_CASE
    * Cho phép người dùng nhập, check tất cá phải in hoa và dấu _, không bắt đầu bằng số, không có dấu khoảng trắng*/
    @Id
    @Column(name = "permission_id",length = 100)
    String permissionId;

    /* VD: Tạo án mới */
    @Column(length = 100)
    String name;

    /* VD: Chức năng giúp người dùng tạo án mới*/
    @Column(length = 255)
    String description;
}
