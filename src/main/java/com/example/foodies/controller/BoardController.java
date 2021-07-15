package com.example.foodies.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.foodies.config.auth.PrincipalDetails;
import com.example.foodies.model.Restaurant;
import com.example.foodies.model.freeboard.FreeBoard;
import com.example.foodies.service.BoardService;
import com.example.foodies.service.MemberService;
import com.example.foodies.service.RestaurantService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private RestaurantService restaurantService;
	
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
	
	// 자유게시판==> 페이징
	@GetMapping("list")
	public String list(Model model,
			@PageableDefault(size=5, sort = "member_id", direction = Sort.Direction.DESC)
	                   Pageable pageable) {
		
		List<FreeBoard> lists=boardService.findMemberAll();
		
		model.addAttribute("lists",lists);
		return "/board/freeBoard";
	}
	//추천식당 목록
	@GetMapping("recommend-photo")
	public String list(Model model) {
		List<Restaurant> lists=boardService.findAll();
		model.addAttribute("lists", lists);
		
		return "/main/recommend-photo";
	}
	//게시판 글쓰기
	@GetMapping("insert")
	//@PreAuthorize("isAuthenticated()")
	public String insert() {
		return "/board/insert";
	}
	@PostMapping("insert")
	public String insert(FreeBoard freeBoard,@AuthenticationPrincipal PrincipalDetails principal) {
		boardService.insert(freeBoard,principal.getMember());
		return "redirect:/list";
	}
	//상세보기
	@GetMapping("detail/{id}")
	 public String detail(Model model,@PathVariable Long id) {
		Restaurant restaurant = restaurantService.findById(id);
		 model.addAttribute("restaurant", restaurant);
		 return "/restaurants/detail";
	 }
	//검색
	
	 //식당 검색
	@GetMapping("search") 
	public String search(@RequestParam(value="keyword") String keyword, Model model) {
		List<Restaurant> restaurant =boardService.findRestaurantsByKeyword(keyword);
	//검색결과 없을때 
		if(restaurant.size()==0) {
		model.addAttribute("msg", "검색결과가 없습니다");
		
	}
		model.addAttribute("restaurant", restaurant);
		
		return "searchList";
	}
		
	 
	
}
