package server.utils;

import java.time.LocalDate;

public class DateUtil {
    public static LocalDate getMilestoneDate() {
        LocalDate today = LocalDate.now();
        LocalDate milestone = LocalDate.of(today.getYear(), 10, 1);

        if (today.isBefore(milestone)) {
            milestone = milestone.minusYears(1);
        }
        return milestone;
    }
}
