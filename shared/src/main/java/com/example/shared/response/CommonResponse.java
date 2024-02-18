package com.example.shared.response;

import com.example.shared.constant.Constant;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommonResponse<T> implements Serializable {
    protected String code;
    protected String message;
    protected T result;

    public CommonResponse(T result) {
        this.code = Constant.SUCCESS_CODE;
        this.message = Constant.SUCCESS_MESSAGE;
        this.result = result;
    }

    public static CommonResponse<Object> successResponse(Object result) {
        return new CommonResponse<>(
                Constant.SUCCESS_CODE,
                Constant.SUCCESS_MESSAGE,
                result
        );
    }

    public static CommonResponse<Object> internalError() {
        return new CommonResponse<>(
                Constant.INTERNAL_SERVER_ERROR_CODE,
                Constant.INTERNAL_SERVER_ERROR_MESSAGE,
                null
        );
    }
}
