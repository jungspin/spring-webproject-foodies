package com.example.foodies.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.foodies.config.auth.PrincipalDetails;
import com.example.foodies.handler.CunstomValidationException;
import com.example.foodies.model.RestAttach;
import com.example.foodies.model.Restaurant;
import com.example.foodies.model.ReviewBoard;
import com.example.foodies.model.member.AuthMailDTO;
import com.example.foodies.model.member.Member;
import com.example.foodies.model.member.RegisterDTO;
import com.example.foodies.service.BoardService;
import com.example.foodies.service.MemberService;
import com.example.foodies.service.RestaurantService;

import lombok.extern.java.Log;



// 주소설계
// /member/* : member 권한이 있어야합니다
// /manager/* : manager 권한이 있어야합니다
// /그외 : 별도의 권한 없이 접근 가능합니다

@Log
@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private RestaurantService restaurantService;
	
	@Autowired
	private MultipartModule multipartModule;
	
	@Autowired
	private BoardService boardService;
	
	
	// 로그인 폼
	//@GetMapping("/login")
	@RequestMapping("/login") // 이것때문에 failure 핸들러에서 오류났음 405
	public String login() {
		return "/user/login";
	}

	// 회원가입 폼으로 가기
	@GetMapping("/register")
	public String register(Model model) {
		model.addAttribute("member", new Member());
		return "/user/register";
	}
	

	// 아이디 중복검사
	@PostMapping("/register/checkId")
	@ResponseBody
	public int idCheck(@RequestBody String username) {
		//System.out.println(username);
		int result = memberService.findByUsername(username);
		if (result == 1) { // 아이디 존재
			return 1;
		}
		return -1; // 아이디 없음
		
	}
	
	// 인증메일을 보내기위함
	// 서비스단에서 처리하려니까 안되더라?
	@Autowired
	private JavaMailSender javaMailSender;
	
	@Autowired
	private BCryptPasswordEncoder encoder;

	@PostMapping("/register/checkEmail")
	@ResponseBody
	public String emailCheck(@RequestBody String email) {
		Random random = new Random();
		String authKey = ""; // 인증번호

		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(email); // 이메일 받을 사람의 주소
		// 입력 키를 위한 코드
		for (int i = 0; i < 3; i++) {
			int index = random.nextInt(25) + 65; // A~Z까지 랜덤 알파벳 생성
			authKey += (char) index;
		}
		int numIndex = random.nextInt(9999) + 1000; // 4자리 랜덤 정수를 생성
		authKey += numIndex;
		message.setSubject("Foodies 이메일 인증을 완료해주세요");
		message.setText("인증 번호 : " + authKey);
		javaMailSender.send(message);
		
		// 인증키 암호화
		String encodedKey = encoder.encode(authKey);
		
		return encodedKey;
		//return "good";
		
	}
	
	// 이메일 인증
	@PostMapping("/register/checkKey")
	@ResponseBody
	public String checkKey(@RequestBody AuthMailDTO authMailDTO  ) {
		//System.out.println("authMailDTO : " + authMailDTO);
		
		if (!encoder.matches(authMailDTO.getRawKey(), authMailDTO.getEncodedKey())) {
			return "fail";
		}
		return "success";
	}
	
	
	// 회원가입
	@PostMapping("/register")
	public String register(@Valid RegisterDTO registerDTO, BindingResult bindingResult) {
		//System.out.println("original : " + registerDTO);
		
		if (bindingResult.hasErrors()) {
			Map<String, String> errorMap = new HashMap<>();
			for (FieldError error : bindingResult.getFieldErrors()) {
				errorMap.put(error.getField(), error.getDefaultMessage());
				System.out.println(error.getDefaultMessage());
				
			}
			throw new CunstomValidationException("유효성 검사 실패", errorMap);
		} else {
			Member member = registerDTO.toEntity();
			memberService.register(member);
			//System.out.println("new : " + member);
			return "/user/login";
		}
		
	}


	// ================== 여기서부터 member 권한이 있어야 접근이 가능합니다 ==========================
	
	// 마이페이지
	@GetMapping("/member/mypage/{id}")
	public String getMypage(@PathVariable Long id, Model model) {
		model.addAttribute("member", memberService.findById(id));
		return "/user/mypage";
	}
	
	/*
	// 회원정보 보기전 비밀번호 확인 폼
	@GetMapping("/member/getInfo")
	public String getInfo(@AuthenticationPrincipal PrincipalDetails principal, Model model) {
		//System.out.println(principal);
		model.addAttribute("principal", principal);
		return "/user/getInfo";
	}
	*/
	
	/*
	// 비밀번호 확인후 수정페이지 이동
	@PostMapping("/member/getInfo")
	@ResponseBody
	public String getUpdate(@RequestBody LoginReqDTO loginReqDTO, Model model) {
		System.out.println("수정페이지 가는 컨트롤러");
		//System.out.println(loginReqDTO);
		int result = memberService.matchPassword(loginReqDTO);
		//System.out.println(result);
		if (result != 1) {
			return "fail";
		} else {
			return "success";
		}
		//Member member = memberService.findById(loginReqDTO.getId());
		//model.addAttribute("member", member);
		
	}
	*/
	
	// 수정 페이지 가기
	@GetMapping("/member/update/{id}")
	public String update(@PathVariable Long id, Model model) {
		model.addAttribute("member", memberService.findById(id));
		return "/user/update";
	}
	
	// 수정하기
	@PutMapping("/member/update")
	@ResponseBody
	public String update(@RequestBody @Valid RegisterDTO registerDTO, BindingResult bindingResult) {
		System.out.println("수정컨트롤러 탔당");
		//System.out.println(registerDTO);
		if (bindingResult.hasErrors()) {
			Map<String, String> errorMap = new HashMap<>();
			for (FieldError error : bindingResult.getFieldErrors()) {
				errorMap.put(error.getField(), error.getDefaultMessage());
				System.out.println(error.getDefaultMessage());
				
			}
			throw new CunstomValidationException("유효성 검사 실패", errorMap);
		} else {
			Member member = registerDTO.toEntity();
			memberService.update(member);
			//System.out.println("new : " + member);
			return "success";
		}
	}
	
	// 탈퇴하기
	@DeleteMapping("/member/delete/{id}")
	@ResponseBody
	public String delete(@PathVariable Long id) {

		try {
			memberService.delete(id); // 그냥 덜렁 이렇게 두면 위험하다고 함
			return "success";
		} catch (Exception e) {
			return "없는 아이디는 삭제할 수 없습니다.";
		}
	}
	
	// 리뷰쓰기 페이지 이동
	@GetMapping("/member/review/{id}")
	public String reviewForm(@PathVariable Long id, Model model, @AuthenticationPrincipal PrincipalDetails principal) {
		Restaurant restaurant = restaurantService.findById(id);
		model.addAttribute("restaurant", restaurant);
		model.addAttribute("principal", principal);
		return "/board/review";
	}
	

	
	// 리뷰쓰기
	@PostMapping("/member/review")
	public String review(ReviewBoard reviewBoard, HttpServletRequest request,
			@RequestParam("files") List<MultipartFile> files, RedirectAttributes redirect) throws IllegalStateException, IOException {
		log.info("reviewBoard : " + reviewBoard);
		
		List<RestAttach> attachList =  multipartModule.imgUpload(request, files);
		
		boardService.insertReviewAndImg(reviewBoard, attachList);
		
		redirect.addAttribute("review", reviewBoard);
		redirect.addAttribute("attachList", attachList);
		
		return "redirect:/detail/"+reviewBoard.getRestaurant().getId();
		
	}
	
	

}
