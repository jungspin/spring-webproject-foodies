package com.example.foodies.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.foodies.config.auth.PrincipalDetails;
import com.example.foodies.model.RestAttach;
import com.example.foodies.model.Restaurant;
import com.example.foodies.model.freeboard.FreeBoard;
import com.example.foodies.service.BoardService;
import com.example.foodies.service.CommentService;
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

	@Autowired
	private CommentService commentService;

	@GetMapping("/")
	public String home(Model model) {
		
		  // 난수 생성 해보면 좋을듯
	  
		 //Long id = (long) 2; Restaurant restaurant = boardService.list(id);
		 //model.addAttribute("food", restaurant);
		 
		 ////추천식당 목록
		 List<Restaurant> lists=boardService.findAll();
			model.addAttribute("lists", lists);
		return "/main/home";
	}
	
	// 자유게시판==> 페이징
	@GetMapping("list")
	public String list(Model model,
			@PageableDefault(size=5, sort = "id", direction = Sort.Direction.DESC)
	                   Pageable pageable) {
		
		Page<FreeBoard> lists= boardService.findAll(pageable);
		model.addAttribute("count", boardService.count());
		model.addAttribute("rowNo", boardService.count()-(lists.getNumber()*5));
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
	//자유게시판 글쓰기
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
		List<RestAttach> attachList =  restaurantService.findByRestaurant(restaurant);
		 model.addAttribute("restaurant", restaurant);
		 model.addAttribute("attachList", attachList);
		 return "/restaurants/detail";
	 }
	//자유게시판 상세보기
	@GetMapping("/board/view/{id}")
	 public String freeBoardDetail(Model model,@PathVariable Long id,@AuthenticationPrincipal PrincipalDetails principal,FreeBoard freeBoard) {
			/*
			 * List<FreeComment> freeComment =commentService.list(freeBoard);
			 * model.addAttribute("freeComment",freeComment);
			 */
		 FreeBoard f = boardService.findById(id);
		 model.addAttribute("freeBoard", f);
		
		 model.addAttribute("principal", principal);
		
		 return "/board/view";
	}
	//자유게시판 수정폼 
	@GetMapping("/board/updateFreeboard/{id}")
	public String update(@PathVariable Long id, Model model) {
		model.addAttribute("freeBoard", boardService.view(id));
		return "/board/updateFreeboard";
		
	}
	//자유게시판 수정 
	@PutMapping("/board/updateFreeboard/{id}")
	@ResponseBody
	public String update(@RequestBody FreeBoard freeBoard) {
		System.out.println("실행됨");
		boardService.update(freeBoard);
		return "success";
		
	}
	//자유게시판 삭제
	@DeleteMapping("/board/delete/{id}")
	@ResponseBody
	public String delete(@PathVariable Long id) {
		boardService.delete(id);
		return "success";
}

	
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
