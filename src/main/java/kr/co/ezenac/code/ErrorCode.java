package kr.co.ezenac.code;

import org.springframework.http.HttpStatus;

import lombok.Getter;

@Getter
public enum ErrorCode {

    USERNAMEORPASSWORDNOTFOUNDEXCEPTION (400, "아이디 또는 비밀번호가 일치하지 않습니다.", HttpStatus.BAD_REQUEST),
    FORBIDDENEXCEPTION(403, "해당 요청에 대한 권한이 없습니다.", HttpStatus.FORBIDDEN),
    UNAUTHORIZEDEXCEPTION (401, "로그인 후 이용가능합니다.", HttpStatus.UNAUTHORIZED),
    EXPIREDJWTEXCEPTION(444, "토큰이 만료되었습니다. 다시 로그인해주세요.", HttpStatus.UNAUTHORIZED),
	INCORRECTJWTEXCEPTION(406, "올바르지 않은 토큰입니다.", HttpStatus.NOT_ACCEPTABLE),
    ;

    private int code;

    private String message;

    private HttpStatus status;

    ErrorCode(int code, String message, HttpStatus status) {
        this.code = code;
        this.message = message;
        this.status = status;
    }
}
