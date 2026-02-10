package server.entity;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDateTime;
import java.util.List;

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

    @OneToMany(mappedBy = "batch")
    List<LegalCase> legalCases;
}
