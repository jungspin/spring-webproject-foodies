package com.example.foodies.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class LoginFailureHandler implements AuthenticationFailureHandler{
	
	private final String DEFAULT_FAILURE_URL = "/login";

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		//System.out.println("실패 핸들러 탔당");
		
		String errorMsg = null;
		
		if (exception instanceof BadCredentialsException || exception instanceof InternalAuthenticationServiceException) {
			
			errorMsg = "아이디 또는 비밀번호가 일치하지 않습니다";
			System.out.println(errorMsg);
			
		} else {
			
			errorMsg = "원인을 알 수 없는 에러가 발생했습니다. 관리자에게 문의해주세요.";
			System.out.println(errorMsg);
		}
		
		request.setAttribute("errorMessage", errorMsg);
		request.getRequestDispatcher(DEFAULT_FAILURE_URL).forward(request, response);
		// 콘솔은 어떻게 잡지ㅠㅠㅠㅠㅠㅠㅠ
	
		
		
	}

}
