package com.example.foodies.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.foodies.service.ApiTestService;

// 디비에 값 넣으면 지우세요!!!!!!!!!!!
@Controller
public class ApiTestController {
	
	@Autowired
	private ApiTestService apiTestService;
	
	@GetMapping("/")
	public void home() {
		apiTestService.dataParse();
		
	}

}
