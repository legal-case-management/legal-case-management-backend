package server.entity.enums;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
@FieldDefaults(level = AccessLevel.PRIVATE)
public enum TypeOfLegalCase {
    CRIMINAL("Hình sự"),
    CIVIL("Dân sự"),
    FAMILY("Hôn nhân gia đình"),
    COMMERCIAL("Kinh doanh thương mại"),
    LABOR("Lao động"),
    ADMINISTRATIVE("Hành chính"),
    BANKRUPTCY("Phá sản"),
    ADMINISTRATIVE_MEASURE("Biện pháp xử lý hành chính");
    String name;

    TypeOfLegalCase(String name) {
        this.name = name;
    }
}
