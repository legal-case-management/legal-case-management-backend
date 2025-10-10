package server.utils;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class DateUtil {
    public static LocalDate getMilestoneDate() {
        LocalDate today = LocalDate.now();
        LocalDate milestone = LocalDate.of(today.getYear(), 10, 1);

        if (today.isBefore(milestone)) {
            milestone = milestone.minusYears(1);
        }
        return milestone;
    }

    public static LocalDateTime getMilestoneDateTime() {
        LocalDateTime today = LocalDateTime.now();
        LocalDateTime milestone = LocalDateTime.of(today.getYear(), 10, 1, 0, 0);

        if (today.isBefore(milestone)) {
            milestone = milestone.minusYears(1);
        }
        return milestone;
    }
}
