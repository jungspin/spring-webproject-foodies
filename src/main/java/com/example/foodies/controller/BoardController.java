package com.example.foodies.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.foodies.model.Restaurant;
import com.example.foodies.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	@GetMapping("/")
	public String home(Model model) {
		
		  // 난수 생성 해보면 좋을듯
	  
		 Long id = (long) 2; Restaurant restaurant = boardService.list(id);
		 model.addAttribute("food", restaurant);
		 
		 ////추천식당 목록
		 List<Restaurant> lists=boardService.findAll();
			model.addAttribute("lists", lists);
		return "/main/home";
	}
	//추천식당보기 
	@GetMapping("recommend-photo/{id}")
	  public String recommendPhoto(@PathVariable Long id, Model model ) {
		Restaurant restaurant = boardService.list(id);
		model.addAttribute("restaurant", restaurant);
		
		return "/main/recommend-photo";
	}
	//추천식당 목록
	@GetMapping("recommend-photo")
	public String list(Model model) {
		List<Restaurant> lists=boardService.findAll();
		model.addAttribute("lists", lists);
		
	
		return "/main/recommend-photo";
	}
}
