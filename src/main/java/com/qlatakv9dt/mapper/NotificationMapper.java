package com.qlatakv9dt.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.NullValuePropertyMappingStrategy;
import org.mapstruct.ReportingPolicy;
import com.qlatakv9dt.dto.response.notification.NotificationResponse;
import com.qlatakv9dt.entity.Notification;

@Mapper(
        componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE,
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE
)
public interface NotificationMapper {
    // Field "read" ở cả entity lẫn DTO -> Lombok sinh getter isRead()/setter setRead() thống nhất,
    // MapStruct tự suy đúng property "read" ở cả 2 phía nên không cần @Mapping tường minh cho field này.
    @Mapping(target = "legalCaseId", source = "legalCase.legalCaseId")
    NotificationResponse toNotificationResponse(Notification notification);
}
