package com.example.foodies.handler;

import java.util.Map;

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

}
