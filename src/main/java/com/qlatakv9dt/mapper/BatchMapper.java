package com.qlatakv9dt.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;
import org.mapstruct.ReportingPolicy;
import com.qlatakv9dt.dto.request.batch.BatchRequest;
import com.qlatakv9dt.dto.response.batch.BatchResponse;
import com.qlatakv9dt.entity.Batch;

@Mapper(
        componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE,
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE
)
public interface BatchMapper {
    Batch toBatch(BatchRequest request);
    BatchResponse toBatchResponse(Batch batch);
    void toBatch(BatchRequest request, @MappingTarget Batch batch);

    default BatchResponse toBatchResponseBasic(Batch batch){
        return BatchResponse.builder()
                .batchId(batch.getBatchId())
                .batchName(batch.getBatchName())
                .build();
    }
}
