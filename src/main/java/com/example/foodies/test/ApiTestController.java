package com.example.foodies.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ApiTestController {
	
	@Autowired
	private ApiTestService apiTestService;
	
	@GetMapping("/getapi")
	public void home() {
		apiTestService.dataParse();
		
	}

}
