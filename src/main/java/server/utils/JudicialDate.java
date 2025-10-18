package server.utils;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class JudicialDate {
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

    public static int getCurrentYear() {
        LocalDate today = LocalDate.now();
        LocalDate milestone = LocalDate.of(today.getYear(), 10, 1);

        if (today.isBefore(milestone)) {
            return today.getYear();
        } else {
            return today.getYear() + 1;
        }
    }

    public static int getCurrentYear(LocalDate date) {
        LocalDate milestone = LocalDate.of(date.getYear(), 10, 1);

        if (date.isBefore(milestone)) {
            return date.getYear();
        } else {
            return date.getYear() + 1;
        }
    }
}
