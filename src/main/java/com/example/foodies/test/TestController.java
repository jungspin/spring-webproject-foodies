package com.example.foodies.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.example.foodies.model.Restaurant;
import com.example.foodies.service.RestaurantService;

@RestController
public class TestController {
	
	@Autowired
	private RestaurantService restaurantService;
	
	@GetMapping("/board/test/{id}")
	public Restaurant test(@PathVariable Long id) {
		 return restaurantService.findById(id);
	}

}
