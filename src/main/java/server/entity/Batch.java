package server.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDateTime;

@Entity
@Table(name = "batches")
@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class Batch {
    @Id
    @Column(name = "batch_id", nullable = false)
    String batchId;
    @Column(name = "batch_name", nullable = false)
    String batchName;

    @Column(name = "storage_date", nullable = false)
    LocalDateTime storageDate;

    String note;
}
