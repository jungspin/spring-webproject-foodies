package com.example.foodies.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {
	

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		//System.out.println("성공 핸들러 탔다");

		passwordEncoder.encode(request.getParameter("password"));
		//System.out.println("password : " + encPwd);

		List<String> roleNames = new ArrayList<String>();
		authentication.getAuthorities().forEach(authotiry -> roleNames.add(authotiry.getAuthority()));

		//System.out.println("roleNames : " + roleNames);

		if (roleNames.contains("ROLE_Manager")) { // 권한이 매니저면 관리자페이지로 향함
			response.sendRedirect("/");
			return;
		} else {
			response.sendRedirect("/"); // 일반 유저일 경우 홈페이지로 가기
		}
	
		
	}

}
