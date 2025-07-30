package server.entity.enums;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
@FieldDefaults(level = AccessLevel.PRIVATE)
public enum TypeOfLegalCase {
    CRIMINAL("Hình sự", "HS"),
    CIVIL("Dân sự", "DS"),
    FAMILY("Hôn nhân gia đình", "HN"),
    COMMERCIAL("Kinh doanh thương mại", "KT"),
    LABOR("Lao động", "LD"),
    ADMINISTRATIVE("Hành chính", "HC"),
    BANKRUPTCY("Phá sản", "PS"),
    ADMINISTRATIVE_MEASURE("Biện pháp xử lý hành chính", "BP");
    String name;
    String simpleName;

    TypeOfLegalCase(String name, String simpleName) {
        this.name = name;
        this.simpleName = simpleName;
    }
}
