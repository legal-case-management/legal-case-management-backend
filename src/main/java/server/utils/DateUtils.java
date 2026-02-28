package server.utils;

import lombok.AccessLevel;
import lombok.experimental.FieldDefaults;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@FieldDefaults(level = AccessLevel.PRIVATE)
public class DateUtils {
    static DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
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

    public static int getCurrentYear(LocalDateTime date) {
        LocalDateTime milestone = LocalDateTime.of(date.getYear(), 10, 1, 0, 0, 0);

        if (date.isBefore(milestone)) {
            return date.getYear();
        } else {
            return date.getYear() + 1;
        }
    }

    public static String formatLocalDate(LocalDate localDate) {
        return localDate.format(formatter);
    }
}
