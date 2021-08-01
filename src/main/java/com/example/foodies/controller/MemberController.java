package com.example.foodies.controller;

import java.awt.print.Book;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.foodies.config.auth.PrincipalDetails;
import com.example.foodies.handler.CunstomValidationException;
import com.example.foodies.handler.Script;
import com.example.foodies.model.Bookmark;
import com.example.foodies.model.BookmarkDTO;
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
	private BoardService boardService;

	@Autowired
	private Script script;

	// 로그인 폼
	// @GetMapping("/login")
	@RequestMapping("/login") // 이것때문에 failure 핸들러에서 오류났음 405
	public String login(HttpServletRequest request) {
		String referer = request.getHeader("Referer");
		request.getSession().setAttribute("prevPage", referer);
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
		// System.out.println(username);
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
		// return "good";

	}

	// 이메일 인증
	@PostMapping("/register/checkKey")
	@ResponseBody
	public String checkKey(@RequestBody AuthMailDTO authMailDTO) {
		// System.out.println("authMailDTO : " + authMailDTO);

		if (!encoder.matches(authMailDTO.getRawKey(), authMailDTO.getEncodedKey())) {
			return "fail";
		}
		return "success";
	}

	// 회원가입
	@PostMapping("/register")
	public String register(@Valid RegisterDTO registerDTO, BindingResult bindingResult, HttpServletResponse response) throws IOException {
		// System.out.println("original : " + registerDTO);

		if (bindingResult.hasErrors()) {
			Map<String, String> errorMap = new HashMap<>();
			for (FieldError error : bindingResult.getFieldErrors()) {
				errorMap.put(error.getField(), error.getDefaultMessage());
				System.out.println(error.getDefaultMessage());

			}
			script.back("회원가입에 실패했습니다. 다시 요청해주세요", response);
			//throw new CunstomValidationException("유효성 검사 실패", errorMap);
			
			return null;
		} else {
			Member member = registerDTO.toEntity();
			memberService.register(member);
			// System.out.println("new : " + member);
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
			 System.out.println(registerDTO);
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
				// System.out.println("new : " + member);
				return "success";
			}
		}

	// 탈퇴하기
	@DeleteMapping("/member/delete/{id}")
	@ResponseBody
	public String delete(@PathVariable Long id, HttpSession session) {
		log.info("탈퇴 컨트롤러 탐");
		try {
			memberService.delete(id); // 그냥 덜렁 이렇게 두면 위험하다고 함
			session.invalidate();
			log.info("서비스 끝내고옴");
			return "success";
		} catch (Exception e) {
			return "없는 아이디는 삭제할 수 없습니다.";
		}
	}

	// 리뷰쓰기 페이지 이동
	@GetMapping("/member/review/{id}")
	public String reviewForm(@PathVariable Long id, Model model, @AuthenticationPrincipal PrincipalDetails principal,
			HttpServletResponse response) throws IOException {
		
		int result = boardService.findReview(principal.getMember().getId(), id); // 검증

		if (result != 1) { // 리뷰 쓴적 있음
			script.href("리뷰는 한번만 작성할 수 있어요😢", "/detail/" + id, response);
			return null;
		}
		
		Restaurant restaurant = restaurantService.findById(id);
		
		model.addAttribute("restaurant", restaurant);
		model.addAttribute("principal", principal);
		return "/restaurants/review";
	}

	// 리뷰쓰기
	@PostMapping("/member/review/{id}")
	public String review(@PathVariable Long id, ReviewBoard reviewBoard, RedirectAttributes redirect) {

		boardService.insertReview(reviewBoard);

		return "redirect:/detail/" + id;
	}

	// 리뷰 삭제
	@DeleteMapping("/member/review/del/{id}")
	@ResponseBody
	public String deleteReview(@PathVariable Long id) {
		log.info("리뷰삭제컨트롤러탐");
		try {
			boardService.deleteReview(id);
			return "success";
		} catch (Exception e) {
			return "없는 아이디는 삭제할 수 없습니다.";
		}
	}

	// 찜하기
	@PostMapping("/member/bookmark")
	@ResponseBody
	public String bookmark(@RequestBody BookmarkDTO bookmarkDTO) {
		log.info("bookmarkDTO : " + bookmarkDTO);
		memberService.bookmark(bookmarkDTO);

		return "success";
	}

	// 찜 상태?
	@GetMapping("/member/bookmark/{id}")
	@ResponseBody
	public List<Bookmark> getBookmark(@PathVariable Long id) {
		return memberService.findByMemberId(id);
	}

	// 찜 취소
	@DeleteMapping("/member/bookmark/del/{id}")
	@ResponseBody
	public String delBookmark(@PathVariable Long id) {
		try {
			memberService.deleteByBookmarkId(id);
			return "success";
		} catch (Exception e) {
			e.getMessage();
			return "fail";
		}
	}

	// 찜 목록 보기로 가기
	@GetMapping("/member/mypage/bookmark/{id}")
	public String bookmarkList(@PathVariable Long id, Model model,
			@AuthenticationPrincipal PrincipalDetails principal) {
		// 멤버 아이디로 찾기..

		model.addAttribute("bookmarkLists", memberService.findByMemberId(id));
		model.addAttribute("principal", principal);
		return "/user/bookmark";
	}

}
