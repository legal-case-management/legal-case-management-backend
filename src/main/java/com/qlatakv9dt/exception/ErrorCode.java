package com.qlatakv9dt.exception;

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
    TOO_MANY_REQUESTS(429, HttpStatus.TOO_MANY_REQUESTS, "Quá nhiều yêu cầu, vui lòng thử lại sau"),

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
    NEW_PASSWORD_NOT_MATCH(400, HttpStatus.BAD_REQUEST, "Mật khẩu mới và mật khẩu mới nhập lại không trùng khớp"),
    SEND_EMAIL_FAILED(500, HttpStatus.INTERNAL_SERVER_ERROR, "Gửi email thất bại"),
    OTP_EXPIRED(400, HttpStatus.BAD_REQUEST, "Mã OTP đã hết hạn"),
    OTP_SENT(400, HttpStatus.BAD_REQUEST, "Mã OTP đã được gửi, vui lòng kiểm tra email"),
    OTP_INVALID(400, HttpStatus.BAD_REQUEST, "Mã OTP không hợp lệ"),
    VERIFY_OTP_FAILED(500, HttpStatus.INTERNAL_SERVER_ERROR, "Xác thực mã OTP thất bại"),
    ACCOUNT_BLOCKED(400, HttpStatus.BAD_REQUEST, "Tài khoản đã bị khóa"),

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
    LEGAL_CASE_NOT_WAITING_FOR_ASSIGNMENT(400, HttpStatus.BAD_REQUEST, "Vụ án không ở trạng thái chờ phân công"),
    LEGAL_CASE_AMBIGUOUS_FOR_IMPORT(400, HttpStatus.BAD_REQUEST, "Tìm thấy nhiều vụ án khớp với tiêu chí"),
    LEGAL_CASE_NOT_FOUND_FOR_IMPORT(404, HttpStatus.NOT_FOUND, "Không tìm thấy vụ án khớp với tiêu chí"),

    RANDOM_ASSIGNMENT_FAILED(500, HttpStatus.INTERNAL_SERVER_ERROR, "Phân công án ngẫu nhiên thất bại"),
    NO_JUDGES_AVAILABLE_FOR_LEGAL_CASES(400, HttpStatus.BAD_REQUEST, "Không có đủ thẩm phán nào đủ điều kiện để phân công cho các vụ án"),
    ASSIGN_ASSIGNMENT_FAILED(500, HttpStatus.INTERNAL_SERVER_ERROR, "Phân công án chỉ định thất bại"),
    LEGAL_CASE_NOT_ASSIGNED(400, HttpStatus.BAD_REQUEST, "Vụ án chưa được phân công"),
    CRIMINAL_CASE_CANNOT_HAVE_MEDIATOR(400, HttpStatus.BAD_REQUEST, "Án hình sự không được có hòa giải viên"),

    /* Judge */
    JUDGE_NOT_EXISTED(404, HttpStatus.NOT_FOUND, "Thẩm phán không tồn tại"),
    JUDGE_EXISTED(404, HttpStatus.BAD_REQUEST, "Thẩm phán đã tồn tại"),
    JUDGE_ASSIGNED_TO_LEGAL_CASE(400, HttpStatus.BAD_REQUEST, "Thẩm phán đã được phân công cho vụ án"),
    JUDGE_NOT_AVAILABLE(400, HttpStatus.BAD_REQUEST, "Thẩm phán không đủ điều kiện để được phân công"),

    /* Mediator */
    MEDIATOR_NOT_EXISTED(404, HttpStatus.NOT_FOUND, "Hòa giải viên không tồn tại"),
    MEDIATOR_EXISTED(404, HttpStatus.BAD_REQUEST, "Hòa giải viên đã tồn tại"),
    MEDIATOR_ASSIGNED_TO_LEGAL_CASE(400, HttpStatus.BAD_REQUEST, "Hòa giải viên đã được phân công cho vụ án"),

    /* Legal relationship */
    LEGAL_RELATIONSHIP_NOT_EXISTED(404, HttpStatus.NOT_FOUND, "Quan hệ pháp luật không tồn tại"),
    LEGAL_RELATIONSHIP_NAME_EXISTED(404, HttpStatus.BAD_REQUEST, "Tên quan hệ pháp luật đã tồn tại"),
    LEGAL_RELATIONSHIP_EXISTED(404, HttpStatus.BAD_REQUEST, "Quan hệ pháp luật đã tồn tại"),


    /* Type of legal case */
    TYPE_OF_LEGAL_CASE_NOT_EXISTED(404, HttpStatus.NOT_FOUND, "Loại vụ án không tồn tại"),
    TYPE_OF_LEGAL_CASE_NAME_EXISTED(404, HttpStatus.BAD_REQUEST, "Tên loại vụ án đã tồn tại"),
    TYPE_OF_LEGAL_CASE_CODE_EXISTED(404, HttpStatus.BAD_REQUEST, "Tên viết tắt loại vụ án đã tồn tại"),
    TYPE_OF_LEGAL_CASE_EXISTED(404, HttpStatus.BAD_REQUEST, "Loại vụ án đã tồn tại"),

    /* Legal relationship group*/
    LEGAL_RELATIONSHIP_GROUP_NOT_EXISTED(404, HttpStatus.NOT_FOUND, "Nhóm quan hệ pháp luật không tồn tại"),

    /* Batch */
    BATCH_NOT_EXISTED(404, HttpStatus.NOT_FOUND, "Đợt nhập án không tồn tại"),
    BATCH_EXISTED(404, HttpStatus.BAD_REQUEST, "Đợt nhập án đã tồn tại"),
    BATCH_CANNOT_BE_DELETED(400, HttpStatus.BAD_REQUEST, "Đợt nhập án không thể bị xóa vì có vụ án thuộc đợt này"),

    NO_JUDGES_AVAILABLE(400, HttpStatus.BAD_REQUEST, "Không có thẩm phán thỏa điều kiện phân công"),
    NO_LEGAL_CASES_FOUND(404, HttpStatus.NOT_FOUND, "Không tìm thấy vụ án"),

    /* Type of decision */
    TYPE_OF_DECISION_NAME_EXISTED(404, HttpStatus.BAD_REQUEST, "Tên loại quyết định đã tồn tại"),
    TYPE_OF_DECISION_NOT_EXISTED(404, HttpStatus.NOT_FOUND, "Loại quyết định không tồn tại"),
    TYPE_OF_DECISION_EXISTED(404, HttpStatus.NOT_FOUND, "Loại quyết định đã tồn tại"),

    /* Handle type of decision */
    HANDLE_TYPE_OF_DECISION_EXISTED(404, HttpStatus.BAD_REQUEST, "Loại quyết định, thông báo đã tồn tại"),
    HANDLE_TYPE_OF_DECISION_NOT_EXISTED(404, HttpStatus.BAD_REQUEST, "Loại quyết định, thông báo không tồn tại"),

    /* Decision */
    DECISION_EXISTED(404, HttpStatus.BAD_REQUEST, "Quyết định, thông báo đã tồn tại"),
    DECISION_NOT_EXISTED(404, HttpStatus.NOT_FOUND, "Quyết định, thông báo không tồn tại"),
    CAN_NOT_HANDLE_TYPE_OF_DECISION(400, HttpStatus.BAD_REQUEST, "Không thể thực hiện loại quyết định, thông báo này với trạng thái hiện tại của vụ án"),
    HANDLE_DECISION_TYPE_BLOCKED(400, HttpStatus.BAD_REQUEST, "Không thể thực hiện loại quyết định, thông báo này với trạng thái hiện tại của vụ án"),

    /* Random assignment */
    RANDOM_ASSIGNMENT_NOT_ALLOWED(400, HttpStatus.BAD_REQUEST, "Nhóm quan hệ pháp luật không được phép phân công ngẫu nhiên"),

    /* Notification */

    NOTIFICATION_NOT_EXISTED(404, HttpStatus.NOT_FOUND, "Thông báo không tồn tại"),


    /* Statistic */

    START_DATE_AFTER_END_DATE(400, HttpStatus.BAD_REQUEST, "Ngày bắt đầu phải trước ngày kết thúc"),
    INVALID_PARAMETERS(400, HttpStatus.BAD_REQUEST, "Tham số không hợp lệ"),

    /* Role / Permission */
    ROLE_NOT_EXISTED(404, HttpStatus.NOT_FOUND, "Vai trò không tồn tại"),
    ROLE_EXISTED(400, HttpStatus.BAD_REQUEST, "Vai trò đã tồn tại"),
    ROLE_ID_INVALID(400, HttpStatus.BAD_REQUEST, "Mã vai trò không hợp lệ (chỉ gồm chữ in hoa và dấu gạch dưới, không bắt đầu bằng số)"),
    ROLE_ADMIN_IMMUTABLE(400, HttpStatus.BAD_REQUEST, "Không thể chỉnh sửa hoặc xóa vai trò ADMIN"),
    ROLE_IN_USE(400, HttpStatus.BAD_REQUEST, "Không thể xóa vai trò vì đang có tài khoản sử dụng"),
    PERMISSION_NOT_EXISTED(404, HttpStatus.NOT_FOUND, "Quyền không tồn tại")
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
