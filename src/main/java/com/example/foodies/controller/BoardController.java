package com.example.foodies.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.foodies.model.Restaurant;
import com.example.foodies.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	

	@GetMapping("/")
	public String home(Model model) {
		// 난수 생성 해보면 좋을듯
		Long id = (long) 2;
		Restaurant restaurant = boardService.list(id);
		model.addAttribute("food", restaurant);
		return "/main/home";
	}
	
}
