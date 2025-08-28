package server.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;
import org.mapstruct.ReportingPolicy;
import server.dto.request.batch.BatchRequest;
import server.dto.response.batch.BatchResponse;
import server.entity.Batch;

@Mapper(
        componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE,
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE
)
public interface BatchMapper {
    Batch toBatch(BatchRequest request);
    BatchResponse toBatchResponse(Batch batch);
    void updateBatchFromRequest(BatchRequest request, @MappingTarget Batch batch);
}
