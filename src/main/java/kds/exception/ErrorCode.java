package kds.exception;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.experimental.FieldDefaults;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;

@Getter
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public enum ErrorCode {
    UNCATEGORIZED_EXCEPTION(500, HttpStatus.INTERNAL_SERVER_ERROR, "Uncategorized exception"),
    UNKNOWN_ERROR(500, HttpStatus.INTERNAL_SERVER_ERROR, "Unknown error"),

    /* Register customer's account */
    USERNAME_EXISTED(400, HttpStatus.BAD_REQUEST, "Username has been used"),
    USERNAME_MIN_LENGTH(400, HttpStatus.BAD_REQUEST, "Username must be at least 5 characters"),
    EMAIL_EXISTED(400, HttpStatus.BAD_REQUEST, "Email has been used"),
    PHONE_EXISTED(400, HttpStatus.BAD_REQUEST, "Phone has been used"),

    /* Authentication */
    ACCOUNT_NOT_EXISTED(404, HttpStatus.NOT_FOUND, "Account not existed"),
    INVALID_LOGIN_TYPE(500, HttpStatus.INTERNAL_SERVER_ERROR, "Invalid login type"),
    UNAUTHENTICATED(401, HttpStatus.UNAUTHORIZED, "Unauthenticated"),
    ACCESS_DENIED(403, HttpStatus.FORBIDDEN, "Access denied"),
    TOKEN_GENERATION_FAILED(500, HttpStatus.INTERNAL_SERVER_ERROR, "Token generation failed"),
    AUTHENTICATION_FAILED(500, HttpStatus.INTERNAL_SERVER_ERROR, "Authentication failed"),

    /* Verify token */
    TOKEN_EXPIRED(400, HttpStatus.BAD_REQUEST, "Token expired"),
    TOKEN_INVALID(400, HttpStatus.BAD_REQUEST, "Token invalid"),
    TOKEN_LOGGED_OUT(400, HttpStatus.BAD_REQUEST, "Token logged out"),

    /* Logout */
    LOGOUT_FAILED(500, HttpStatus.INTERNAL_SERVER_ERROR, "Logout failed"),

    /* Refresh token */
    REFRESH_TOKEN_FAILED(500, HttpStatus.INTERNAL_SERVER_ERROR, "Refresh token failed"),

    ;

    int status;
    HttpStatusCode httpStatus;
    String message;

    ErrorCode(int status, HttpStatusCode httpStatus, String message) {
        this.status = status;
        this.httpStatus = httpStatus;
        this.message = message;
    }
}
