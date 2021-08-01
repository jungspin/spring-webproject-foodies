package com.example.foodies.handler;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;

@Component
public class Script {
	
	public void back(String msg, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter(); // 버퍼를 만들어줌
		out.println("<script>");
		out.println("alert('"+msg+"');");
		out.println("history.back();"); // 전의 페이지로 데이터 남기고 돌아감
		out.println("</script>");
	}
	
	public  void href(String msg, String url, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter(); // 버퍼를 만들어줌
		out.println("<script>");
		out.println("alert('"+msg+"');");
		out.println("location.href='"+url+"'");
		out.println("</script>");
		// 다른데로도 가고 싶으면 매개변수에  String url 추가해줘라 
	}
}
