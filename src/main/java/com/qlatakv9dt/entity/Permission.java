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

    @Id
    @Column(name = "permission_id",length = 100)
    String permissionId;

    @Column(length = 100)
    String name;

    @Column(length = 255)
    String description;
}
