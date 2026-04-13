package server.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;
import org.mapstruct.ReportingPolicy;
import server.dto.request.document.DocumentRequest;
import server.dto.response.document.DocumentResponse;
import server.entity.Document;
import server.utils.DateUtils;

@Mapper(
        componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE,
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE
)
public interface DocumentMapper {
    DocumentResponse toDocumentResponse(Document document);
    void toDocument(DocumentRequest request, @MappingTarget Document document);
    default String toDecisionInfo(Document document) {
        return String.format("%s-%s, %s", document.getDocumentNumber(), DateUtils.formatLocalDate(document.getReleaseDate()), document.getDocumentType().getDocumentTypeName());
    }
}
