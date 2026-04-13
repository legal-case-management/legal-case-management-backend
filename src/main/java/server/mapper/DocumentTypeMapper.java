package server.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;
import org.mapstruct.ReportingPolicy;
import server.dto.request.documentType.DocumentTypeRequest;
import server.dto.response.documentType.DocumentTypeResponse;
import server.entity.DocumentType;

@Mapper(
        componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE,
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE
)
public interface DocumentTypeMapper {
    DocumentTypeResponse toDocumentTypeResponse(DocumentType documentType);
    void toDocumentType(DocumentTypeRequest request, @MappingTarget DocumentType documentType);
    default DocumentTypeResponse toDocumentTypeResponseBasic(DocumentType documentType){
        return DocumentTypeResponse.builder()
                .documentTypeId(documentType.getDocumentTypeId())
                .documentTypeName(documentType.getDocumentTypeName())
                .build();
    }
}
