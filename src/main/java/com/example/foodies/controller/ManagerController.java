package com.example.foodies.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.foodies.handler.Script;
import com.example.foodies.model.RestAttach;
import com.example.foodies.model.Restaurant;
import com.example.foodies.service.RestaurantService;

import lombok.extern.java.Log;

@Controller
@Log
@RequestMapping("/manager/**")
public class ManagerController {

	@Autowired
	private RestaurantService restaurantService;
	
	@Autowired
	private MultipartModule multipartModule;
	
	@Autowired
	private Script script;

	// ================== 여기서부터 manager 권한이 있어야 접근이 가능합니다 ==========================

	// 관리자 페이지 가기

	// 식당 등록 페이지 가기
	@GetMapping({"/goSubmit","/submit"})
	public String restaurnt() {
		return "/restaurants/resSubmit";
	}

	// 식당 등록
	@PostMapping("/submit")
	public String restaurnt(Restaurant restaurant, HttpServletRequest request,
			@RequestParam("files") List<MultipartFile> files, RedirectAttributes redirect) throws IOException {

	
		List<RestAttach> attachList = multipartModule.imgUpload(request, files);

		restaurantService.insertRestAndImg(restaurant, attachList);

		redirect.addAttribute("restaurant", restaurant);
		redirect.addAttribute("attachList", attachList);

		return "redirect:/detail/" + restaurant.getId(); // 등록완료시 해당 식당 상세보기로 가야됨.
	}

	// 식당 삭제
	@DeleteMapping("/restaurant/del/{id}")
	@ResponseBody
	public String delete(@PathVariable Long id) {
		try {
			restaurantService.deleteByResId(id);
			return "success";
		} catch (Exception e) {
			return "존재하지 않는 정보입니다";
		}
	}

	// 식당 수정 페이지 가기
	@GetMapping("/restaurant/update/{id}")
	public String update(@PathVariable Long id, Model model) {
		System.out.println("식당 수정 컨트롤러 탔당");
		Restaurant restaurant = restaurantService.findById(id);
		List<RestAttach> attachLists = restaurantService.findByRestaurant(restaurant);
		
		model.addAttribute("restaurant", restaurant);
		model.addAttribute("attachLists", attachLists);
		return "/restaurants/resUpdate";

	}

	// 식당 수정 => 미완..
	@PostMapping("/restaurant/update")
	public String update(Restaurant restaurant, HttpServletRequest request, @RequestParam("attachId") List<RestAttach>restAttachs ,
			@RequestParam("files") List<MultipartFile> files, RedirectAttributes redirect, HttpServletResponse response) throws Exception {
		
		log.info("들어온 restaurant : " + restaurant);
		log.info("들어온 files : " + files);
		
		if (restAttachs.contains(null)) { // 리뷰쓰면서 생긴 사진은 null들어옴..
			restAttachs.removeAll(Collections.singletonList(null));

		}
		
		log.info("restAttachs 사이즈 : " + restAttachs.size());
		
		List<RestAttach> fileLists = multipartModule.imgUpload(request, files); // 파일업로드 
		
		if(restaurant.getMainImgThumb() != null) {
			log.info("썸넬 이미지 null 아님");
			restaurant.setMainImgThumb(null);
			log.info("공백으로 만듬");
		}
	
		restaurantService.updateRestAndImg(restaurant, restAttachs , fileLists);
	
		script.href("식당 정보가 수정되었습니다", "/detail/"+restaurant.getId(), response);
		
		return null;
		
	}
}
