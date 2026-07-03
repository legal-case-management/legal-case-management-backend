package com.qlatakv9dt.exception;

import com.qlatakv9dt.dto.response.ApiResponse;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;


@ControllerAdvice
public class GlobalExceptionHandler {
//    @ExceptionHandler(value = Exception.class)
//    ResponseEntity<ApiResponse<?>> handleException(Exception e) {
//        ErrorCode errorCode = ErrorCode.UNCATEGORIZED_EXCEPTION;
//
//        ApiResponse<?> apiResponse = ApiResponse
//                .builder()
//                .success(false)
//                .status(errorCode.getStatus())
//                .error(errorCode.getMessage())
//                .build();
//        return ResponseEntity
//                .status(errorCode.getHttpStatus())
//                .body(apiResponse);
//    }

    @ExceptionHandler(value = AppException.class)
    ResponseEntity<ApiResponse<?>> handleAppException(AppException e) {
        ErrorCode errorCode = e.getErrorCode();
        ApiResponse<?> apiResponse = ApiResponse
                .builder()
                .success(false)
                .status(errorCode.getStatus())
                .error(errorCode.getMessage())
                .build();

        return ResponseEntity
                .status(errorCode.getHttpStatus())
                .body(apiResponse);
    }

    @ExceptionHandler(value = MethodArgumentNotValidException.class)
    ResponseEntity<ApiResponse<?>> handleMethodArgumentNotValidException(MethodArgumentNotValidException e) {
        ErrorCode errorCode = ErrorCode.UNKNOWN_ERROR;

        try {
            errorCode = ErrorCode.valueOf(e.getMessage());
        } catch (Exception ex) {

        }

        ApiResponse<?> apiResponse = ApiResponse
                .builder()
                .success(false)
                .status(errorCode.getStatus())
                .error(errorCode.getMessage())
                .build();

        return ResponseEntity
                .status(errorCode.getHttpStatus())
                .body(apiResponse);
    }

    @ExceptionHandler(value = AccessDeniedException.class)
    ResponseEntity<ApiResponse<?>> handleAccessDeniedException(AccessDeniedException e) {
        ErrorCode errorCode = ErrorCode.ACCESS_DENIED;

        ApiResponse<?> apiResponse = ApiResponse
                .builder()
                .success(false)
                .status(errorCode.getStatus())
                .error(errorCode.getMessage())
                .build();

        return ResponseEntity
                .status(errorCode.getHttpStatus())
                .body(apiResponse);
    }
}