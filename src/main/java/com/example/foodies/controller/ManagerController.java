package com.example.foodies.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

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

import com.example.foodies.model.RestAttach;
import com.example.foodies.model.Restaurant;
import com.example.foodies.service.RestaurantService;
import com.sun.mail.handlers.multipart_mixed;

import lombok.extern.java.Log;

@Controller
@Log
@RequestMapping("/manager/**")
public class ManagerController {

	@Autowired
	private RestaurantService restaurantService;
	
	@Autowired
	private MultipartModule multipartModule;

	// ================== 여기서부터 manager 권한이 있어야 접근이 가능합니다 ==========================

	// 관리자 페이지 가기
	/*
	 * @GetMapping("/") public String manager() { return "/user/manager"; }
	 */

	// 식당 등록 페이지 가기
	@GetMapping("/goSubmit")
	public String restaurnt() {
		return "/board/resSubmit";
	}

	private String getDateFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str;

	}

	// 식당 등록
	@PostMapping("/submit")
	public String restaurnt(Restaurant restaurant, HttpServletRequest request,
			@RequestParam("files") List<MultipartFile> files, RedirectAttributes redirect) throws IOException {

		/*
		// ================= 파일 업로드 작업 시작 ==================
		log.info("files : " + files);
		// log.info("restaurant : " + restaurant );
		// System.out.println(restaurant); // Restaurant(id=null, addr1=,
		// cntctTel=051-809-0301, itemcntnts=와플이 맛있는 서면의 이쁜 카페, mainTitle=모던테이블,
		// mainImgNormal=null, mainImgThumb=null, rprsntvMenu=봄봄초코와플,
		// usageDayWeekAndTime=12:00p.m~23:00p.m, reviewBoards=null)

		if (files != null) {
			log.info("이미지 업로드 갯수 : " + files.size());
		}

		ServletContext application = request.getServletContext();
		String realpath = application.getRealPath("/resources/upload"); // 실제 경로를 가져옴
		log.info("realpath : " + realpath);

		// 폴더 동적 생성하기 /resources/upload/2021/06/15
		File uploadPath = new File(realpath, getDateFolder());

		if (!uploadPath.exists()) { // 실제 해당경로가 존재하는지
			uploadPath.mkdirs();
		}

		List<RestAttach> attachList = new ArrayList<RestAttach>();

		for (MultipartFile multipartFile : files) {
			if (multipartFile.isEmpty()) {
				continue;
			}

			String originalFileName = multipartFile.getOriginalFilename(); // 실제 사용자가 업로드한 파일이름
			UUID uuid = UUID.randomUUID();
			String uploadFileName = uuid.toString() + "_" + originalFileName; // 중복을 피하기 위해서

			// 실제 파일 1개 업로드 수행 완료
			multipartFile.transferTo(new File(uploadPath, uploadFileName)); // 귀찮은 일은 스프링이 해주니까 예외 던져버림

			RestAttach restAttach = new RestAttach().builder()
					.uuid(uuid.toString())
					.filename(originalFileName)
					.uploadpath(getDateFolder())
					.build();

			attachList.add(restAttach);
			// restaurantService.insert(restAttach);

		} // forEach

		// ================= 파일 업로드 작업 끝 ==================
		*/
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
		// log.info("삭제 컨트롤러탐");
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
		Restaurant restaurant = restaurantService.findById(id);
		List<RestAttach> attachLists = restaurantService.findByRestaurant(restaurant);
		model.addAttribute("restaurant", restaurant);
		model.addAttribute("attachLists", attachLists);
		return "/board/resUpdate";

	}

	// 식당 수정 => 미완..
	@PostMapping("/restaurant/update")
	public String update(Restaurant restaurant, HttpServletRequest request,
			@RequestParam("files") List<MultipartFile> files, RedirectAttributes redirect) throws IllegalStateException, IOException {
		
		log.info("들어온 데이터 : " + restaurant);
		
		
		//Restaurant updateRest = restaurantService.updateRest(restaurant);
		
		log.info("식당 수정 컨트롤러 탔음");
		
		// ================= 파일 업로드 작업 시작 ==================
		log.info("files : " + files);

		if (files != null) {
			log.info("이미지 업로드 갯수 : " + files.size());
		}

		ServletContext application = request.getServletContext();
		String realpath = application.getRealPath("/resources/upload"); // 실제 경로를 가져옴
		log.info("realpath : " + realpath);

		// 폴더 동적 생성하기 /resources/upload/2021/06/15
		File uploadPath = new File(realpath, getDateFolder());

		if (!uploadPath.exists()) { // 실제 해당경로가 존재하는지
			uploadPath.mkdirs();
		}

		//List<RestAttach> attachList = restaurantService.findByRestaurant(updateRest); // 기존의 데이터 나옴
		List<RestAttach> attachList = new ArrayList<RestAttach>();
		
		log.info("진행중1");

		for (MultipartFile multipartFile : files) {
			if (multipartFile.isEmpty()) {
				continue;
			}

			String originalFileName = multipartFile.getOriginalFilename(); // 실제 사용자가 업로드한 파일이름
			UUID uuid = UUID.randomUUID();
			String uploadFileName = uuid.toString() + "_" + originalFileName; // 중복을 피하기 위해서

			// 실제 파일 1개 업로드 수행 완료
			multipartFile.transferTo(new File(uploadPath, uploadFileName)); // 귀찮은 일은 스프링이 해주니까 예외 던져버림

			RestAttach restAttach = new RestAttach().builder()
									.uuid(uuid.toString())
									.filename(originalFileName)
									.uploadpath(getDateFolder())
									.restaurant(restaurant)
									.build();

			attachList.add(restAttach);
			
			// restaurantService.insert(restAttach);

		} // forEach
		log.info("컨트롤러 attachList : " + attachList);

		// ================= 파일 업로드 작업 끝 ==================
		
		log.info("진행중2");
		
		
		restaurantService.updateRestAndImg(restaurant, attachList);
		
		//redirect.addAttribute("restaurant", updateRest);
		//redirect.addAttribute("attachList", updateList);
		
		log.info("식당 수정 컨트롤러 끝");

		return "redirect:/detail/" + restaurant.getId(); // 등록완료시 해당 식당 상세보기로 가야됨.
	}
}
