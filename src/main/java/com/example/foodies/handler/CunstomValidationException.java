package com.example.foodies.handler;

import java.util.Map;

public class CunstomValidationException extends RuntimeException{

	// jvm이 객체를 구분할 때
	private static final long serialVersionUID = 1L;
	
	private Map<String, String> errorMap;
	
	public CunstomValidationException(String message, Map<String, String> errorMap) {
		super(message);
		this.errorMap = errorMap;
	}

	public Map<String, String> getErrorMap() {
		return errorMap;
	}
	
	

}
