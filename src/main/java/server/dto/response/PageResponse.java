package server.dto.response;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class PageResponse<T> {
    int number;
    int size;
    int numberOfElement;
    long totalElements;
    int totalPages;
    boolean hasNext;
    boolean hasPrevious;
    boolean isFirst;
    boolean isLast;
    List<T> content;
}
