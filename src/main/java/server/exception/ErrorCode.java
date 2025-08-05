package server.exception;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.experimental.FieldDefaults;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;

@Getter
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public enum ErrorCode {
    UNCATEGORIZED_EXCEPTION(500, HttpStatus.INTERNAL_SERVER_ERROR, "Lỗi chưa được phân loại"),
    UNKNOWN_ERROR(500, HttpStatus.INTERNAL_SERVER_ERROR, "Lỗi không xác định"),

    /* Register customer's account */
    USERNAME_EXISTED(400, HttpStatus.BAD_REQUEST, "Tên đăng nhập đã được sử dụng"),
    USERNAME_MIN_LENGTH(400, HttpStatus.BAD_REQUEST, "Tên đăng nhập tối thiểu 5 kí tự"),
    EMAIL_EXISTED(400, HttpStatus.BAD_REQUEST, "Email đã được sử dụng"),

    /* Authentication */
    ACCOUNT_NOT_EXISTED(404, HttpStatus.NOT_FOUND, "Tài khoản không tồn tại"),
    INVALID_PASSWORD(404, HttpStatus.BAD_REQUEST, "Mật khẩu sai"),
    UNAUTHENTICATED(401, HttpStatus.UNAUTHORIZED, "Chưa xác thực"),
    ACCESS_DENIED(403, HttpStatus.FORBIDDEN, "Bị từ chối truy cập"),
    TOKEN_GENERATION_FAILED(500, HttpStatus.INTERNAL_SERVER_ERROR, "Lỗi sinh token"),
    AUTHENTICATION_FAILED(500, HttpStatus.INTERNAL_SERVER_ERROR, "Xác thực thất bại"),

    /* Verify token */
    TOKEN_EXPIRED(400, HttpStatus.BAD_REQUEST, "Token quá hạn"),
    TOKEN_INVALID(400, HttpStatus.BAD_REQUEST, "Token không hợp lệ"),
    TOKEN_LOGGED_OUT(400, HttpStatus.BAD_REQUEST, "Token đã đăng xuất"),

    /* Logout */
    LOGOUT_FAILED(500, HttpStatus.INTERNAL_SERVER_ERROR, "Đăng xuất thất bại"),

    /* Refresh token */
    REFRESH_TOKEN_FAILED(500, HttpStatus.INTERNAL_SERVER_ERROR, "Gia hạn phiên đăng nhập thất bại"),

    /* Legal case */
    LEGAL_CASE_NOT_EXISTED(404, HttpStatus.NOT_FOUND, "Vụ án không tồn tại"),
    LEGAL_CASE_EXISTED(404, HttpStatus.BAD_REQUEST, "Vụ án đã tồn tại"),

    /* Judge */
    JUDGE_NOT_EXISTED(404, HttpStatus.NOT_FOUND, "Thẩm phán không tồn tại"),
    JUDGE_EXISTED(404, HttpStatus.BAD_REQUEST, "Thẩm phán đã tồn tại"),

    /* Legal relationship */
    LEGAL_RELATIONSHIP_NOT_EXISTED(404, HttpStatus.NOT_FOUND, "Quan hệ pháp luật không tồn tại"),

    /* Type of legal case */
    TYPE_OF_LEGAL_CASE_NOT_EXISTED(404, HttpStatus.NOT_FOUND, "Loại vụ án không tồn tại"),
    TYPE_OF_LEGAL_CASE_NAME_EXISTED(404, HttpStatus.BAD_REQUEST, "Tên loại vụ án đã tồn tại"),
    TYPE_OF_LEGAL_CASE_ID_EXISTED(404, HttpStatus.BAD_REQUEST, "Mã loại vụ án đã tồn tại")
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
