package com.qlatakv9dt.validator;

import jakarta.validation.Constraint;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import jakarta.validation.Payload;
import lombok.AccessLevel;
import lombok.experimental.FieldDefaults;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Objects;

import static java.lang.annotation.ElementType.FIELD;

@Target({FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = {
        MinAgeValidator.class
})
public @interface DateOfBirthConstraint {
    String message() default "Date of birth invalid";

    int minAge() default 0;

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}

@FieldDefaults(level = AccessLevel.PRIVATE)
class MinAgeValidator implements ConstraintValidator<DateOfBirthConstraint, LocalDate> {
    int minAge;

    @Override
    public void initialize(DateOfBirthConstraint constraintAnnotation) {
        ConstraintValidator.super.initialize(constraintAnnotation);
        minAge = constraintAnnotation.minAge();
    }

    @Override
    public boolean isValid(LocalDate value, ConstraintValidatorContext context) {
        if (Objects.isNull(value))
            return true;

        long year = ChronoUnit.YEARS.between(value, LocalDate.now());

        return year >= minAge;
    }
}