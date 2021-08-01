package com.example.foodies.handler;

import java.io.IOException;
import java.util.Map;

import javax.mail.AuthenticationFailedException;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.java.Log;

@Log
@ControllerAdvice
@RestController
public class ControllerExceptionHandler {
	
	@Autowired
	private Script script;
	
	@ExceptionHandler(CunstomValidationException.class)
	public Map<String, String> validationException(CunstomValidationException e){
		return e.getErrorMap();
	}
	
	// 안되네..흠
	@ExceptionHandler(InternalAuthenticationServiceException.class)
	public void handleInternalAuthenticationServiceException(InternalAuthenticationServiceException e, HttpServletResponse response) {
		try {
			script.back("아이디 또는 비밀번호가 일치하지 않습니다", response);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	
	@ExceptionHandler(IndexOutOfBoundsException.class)
	public void handleIndexOutOfBoundsException(IndexOutOfBoundsException e, HttpServletResponse response) {
		try {
			script.back("올바른 검색어를 입력해주세요", response);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	

}
