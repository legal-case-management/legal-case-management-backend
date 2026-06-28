package server.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.NullValuePropertyMappingStrategy;
import org.mapstruct.ReportingPolicy;
import server.dto.response.notification.NotificationResponse;
import server.entity.Notification;

@Mapper(
        componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE,
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE
)
public interface NotificationMapper {
    // Bắt buộc map trường boolean isRead (MapStruct + @SuperBuilder/Lombok dễ bỏ sót).
    @Mapping(target = "isRead", source = "read")
    NotificationResponse toNotificationResponse(Notification notification);
}
