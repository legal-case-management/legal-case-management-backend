package com.qlatakv9dt.mapper;

import org.mapstruct.Mapper;
import org.springframework.data.domain.Page;
import com.qlatakv9dt.dto.response.PageResponse;

@Mapper(componentModel = "spring")
public interface PageMapper {
    default <T> PageResponse<T> map(Page<T> page) {
        return PageResponse.<T>builder()
                .number(page.getNumber())
                .size(page.getSize())
                .numberOfElement(page.getNumberOfElements())
                .totalElements(page.getTotalElements())
                .totalPages(page.getTotalPages())
                .hasNext(page.hasNext())
                .hasPrevious(page.hasPrevious())
                .isFirst(page.isFirst())
                .isLast(page.isLast())
                .content(page.getContent())
                .build();
    }
}

