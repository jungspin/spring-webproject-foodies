package com.example.foodies.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.foodies.config.auth.PrincipalDetails;
import com.example.foodies.handler.Script;
import com.example.foodies.model.RestAttach;
import com.example.foodies.model.Restaurant;
import com.example.foodies.model.freeboard.FreeAttach;
import com.example.foodies.model.freeboard.FreeBoard;
import com.example.foodies.repository.FreeAttachRepository;
import com.example.foodies.service.BoardService;
import com.example.foodies.service.MemberService;
import com.example.foodies.service.RestaurantService;

import lombok.extern.java.Log;

@Log
@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private MemberService memberService;

	@Autowired
	private RestaurantService restaurantService;

	@Autowired
	private MultipartModule multipartModule;
	
	@Autowired
	private FreeAttachRepository freeAttachRepository;
	
	@Autowired
	private Script script;

	@GetMapping("/")
	public String home(Model model) {

		//// 추천식당 목록
		List<Restaurant> lists = restaurantService.findByRandom(); // 무작위
		model.addAttribute("lists", lists);
		return "/main/home";
	}

	// 자유게시판==> 페이징
	@GetMapping({"list","/board/view/list","/member/mypage/list","/detail/list","/member/freeboard/list","/member/mypage/bookmark/list"})
	public String list(Model model,
			@PageableDefault(size = 5, sort = "id", direction = Sort.Direction.DESC) Pageable pageable) {

		Page<FreeBoard> lists = boardService.findAll(pageable);
		model.addAttribute("count", boardService.count());
		model.addAttribute("rowNo", boardService.count() - (lists.getNumber() * 5));
		model.addAttribute("lists", lists);
		return "/board/freeBoard";
	}

	// 추천식당 목록
	@GetMapping("recommend-photo")
	public String list(Model model) {
		List<Restaurant> lists = boardService.findAll();
		model.addAttribute("lists", lists);

		return "/main/recommend-photo";
	}

	// 자유게시판 글쓰기 페이지 가기
	@GetMapping("/member/freeboard/insert")
	// @PreAuthorize("isAuthenticated()")
	public String insert(@AuthenticationPrincipal PrincipalDetails principal, Model model) {
		model.addAttribute("principal", principal);
		return "/board/insert";
	}

	// 자유게시판 글쓰기
	@PostMapping("/member/freeboard/insert")
	public String insert(FreeBoard freeBoard, @AuthenticationPrincipal PrincipalDetails principal, HttpServletResponse response,
			HttpServletRequest request, @RequestParam("files") List<MultipartFile> files, RedirectAttributes redirect)
			throws Exception {
		List<FreeAttach> attachList = multipartModule.imgFreeUpload(request, files);

		boardService.insertFreeAndImg(freeBoard, attachList);

		boardService.insert(freeBoard, principal.getMember());
		
		script.href("글이 등록되었습니다", "/board/view/"+freeBoard.getId(), response);
		return null;
		
		//return "redirect:/board/view/"+freeBoard.getId();
	}

	// 식당 상세보기
	@GetMapping("detail/{id}")
	public String detail(Model model, @PathVariable Long id, @AuthenticationPrincipal PrincipalDetails principal) {
		Restaurant restaurant = restaurantService.findById(id);
		List<RestAttach> attachList = restaurantService.findByRestaurant(restaurant);
		Double avgGrade = boardService.findOneAvg(id);
		
		String avg = String.format("%.1f", avgGrade);
		
		int count = memberService.findCountBookmark(id);

		if (principal == null) {
			model.addAttribute("restaurant", restaurant);
			model.addAttribute("attachList", attachList);
			model.addAttribute("avg", avg);
			model.addAttribute("count", count);
			return "/restaurants/detail";
		} else {
			model.addAttribute("restaurant", restaurant);
			model.addAttribute("attachList", attachList);
			model.addAttribute("bookmark", memberService.getBookmark(principal.getMember().getId(), id));
			model.addAttribute("principal", principal);
			model.addAttribute("avg", avg);
			model.addAttribute("count", count);
			return "/restaurants/detail";
		}

	}

	// 자유게시판 상세보기
	@GetMapping("/board/view/{id}")
	public String freeBoardDetail(Model model, @PathVariable Long id,
			@AuthenticationPrincipal PrincipalDetails principal, FreeBoard freeBoard) {

		FreeBoard f = boardService.findById(id);
		List<FreeAttach> attachList = boardService.findByFreeboard(freeBoard);
		model.addAttribute("freeBoard", f);
		model.addAttribute("principal", principal);
		model.addAttribute("attachList", attachList);
		return "/board/view";
	}

	// 자유게시판 수정폼
	@GetMapping("/member/board/updateFreeboard/{id}")
	public String update(@PathVariable Long id, Model model) {
		List<FreeAttach> attachLists = freeAttachRepository.findByFreeBoard(boardService.view(id));
		
		model.addAttribute("freeBoard", boardService.view(id));
		model.addAttribute("attachLists", attachLists);
		return "/board/updateFreeboard";

	}

	// 자유게시판 수정
	@PostMapping("/member/board/updateFreeboard")
	public String update(FreeBoard freeBoard, HttpServletRequest request, HttpServletResponse response,
			@RequestParam("files") List<MultipartFile> files, RedirectAttributes redirect) throws Exception {
		
		log.info("들어온 restaurant : " + freeBoard);
		log.info("들어온 files : " + files);
		
		List<FreeAttach> fileLists = multipartModule.imgFreeUpload(request, files); // 파일업로드 
		
		boardService.updateFreeAndImg(freeBoard, fileLists);
		// "redirect:/board/view/"+freeBoard.getId();
		script.href("수정되었습니다", "/board/view/"+freeBoard.getId(), response);
		return null;
	}

	// 자유게시판 삭제
	@DeleteMapping("/member/board/delete/{id}")
	@ResponseBody
	public String delete(@PathVariable Long id) {
		System.out.println("삭제 컨트롤러 탔당");
		boardService.delete(id);
		return "success";
	}

	// 식당 검색
	@GetMapping
	({"search","/detail/search","/member/mypage/search","/board/view/search","/member/mypage/bookmark/search", "/manager/search", "/manager/restaurant/update/search"})
	public String search(@RequestParam(value = "keyword") String keyword, Model model, HttpServletResponse response) throws IOException {
		System.out.println("keyword : " + keyword);
		
		// 검색창에 아무것도 검색하지 않았을 때 
		
		if (keyword.equals("")) {
			script.back("검색어를 입력해주세요", response);
			return null;
		}
		
		List<Restaurant> restaurants = boardService.findRestaurantsByKeyword(keyword);
		log.info("restaurants size : "+ restaurants.size());
		
		// 검색결과 없을때
		if (restaurants.size() == 0) {
			model.addAttribute("msg", "검색결과가 없습니다");

		}
		
		// 이건 무조건 한건일때! 그렇게 정해놓고 했을 때의 로직이니..
		// 따라서 여러건이 검색되면 오류를 타게 됨
		if (restaurants.size() == 1) {
			for (Restaurant restaurant : restaurants ) {
				log.info("restaurant : restaurants");
				if (restaurant.getMainImgThumb() == null) {
					log.info("getMainImgThumb ");
					for (Restaurant rest : restaurants) {
						log.info("rest : restaurants");
						RestAttach restAttach = restaurantService.findByResId(rest.getId()); 
						log.info("findByRestaurant(rest).get(0)");
						if (restAttach == null) {
							//System.out.println("null");
							script.back("예기치 못한 오류가 발생했습니다. 다시 검색해주세요", response);
							return null;
						}
						Restaurant restaurant2 = restaurantService.findById(rest.getId());
						//System.out.println(restaurant2);
						restaurant2.setMainImgThumb("/resources/upload/"+restAttach.getUploadpath()+"/"+restAttach.getUuid()+"_"+restAttach.getFilename());
						restaurantService.insert(restaurant2);
					}
				}
				
			}
		}
	
		model.addAttribute("restaurant", restaurants);
		model.addAttribute("size", restaurants.size());
		model.addAttribute("keyword", keyword);
		
		return "searchList";
	}

}
