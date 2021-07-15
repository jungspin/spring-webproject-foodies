package com.example.foodies.handler;

import java.util.Map;

import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;

@ControllerAdvice
@RestController
public class ControllerExceptionHandler {
	
	@ExceptionHandler(CunstomValidationException.class)
	public Map<String, String> validationException(CunstomValidationException e){
		return e.getErrorMap();
	}
	
	@ExceptionHandler(InternalAuthenticationServiceException.class)
	public void handleInternalAuthenticationServiceException(InternalAuthenticationServiceException e) {
		
	
		return ;
	}

}
