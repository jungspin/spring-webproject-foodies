package com.example.foodies.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.security.core.annotation.AuthenticationPrincipal;

import com.example.foodies.config.auth.PrincipalDetails;
import com.example.foodies.model.FreeBoard;
import com.example.foodies.model.Restaurant;
import com.example.foodies.model.member.Member;
import com.example.foodies.service.BoardService;
import com.example.foodies.service.MemberService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	@Autowired
	private MemberService memberService;

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
		//Page<Member> members=memberService.findAll(pageable);
		List<FreeBoard> lists=boardService.findMemberAll();
		
		model.addAttribute("lists",lists);
		
		/*
		 * model.addAttribute("count", boardService.count());
		 * model.addAttribute("rowNo", boardService.count()-(members.getNumber()*5)) ;
		 * //p2 ( 6-5
		 */		return "/board/freeBoard";
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

}
