package com.example.foodies.controller;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.foodies.model.Member;
import com.example.foodies.repository.MemberRepository;
import com.example.foodies.service.MemberService;


// 주소설계
// /member/* : member 권한이 있어야합니다
// /manager/* : manager 권한이 있어야합니다
// /그외 : 별도의 권한 없이 접근 가능합니다

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MemberRepository memberRepository;

	// 회원가입 폼으로 가기
	@GetMapping("/register")
	public String register() {
		return "/user/register";
	}
	
	// 회원가입
	@PostMapping("/register")
	public String register(@RequestBody Member member) {
		//System.out.println("original : " + member);
		memberService.register(member);
		return "/user/login";
	}

	// 로그인 폼
	@GetMapping("/login")
	public String login() {
		return "/user/login";
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
		message.setSubject("Foodies 가입을 위한 이메일 인증을 완료해주세요");
		message.setText("아래 인증번호를 회원가입 시 입력해주세요.");
		message.setText("인증 번호 : " + authKey);
		javaMailSender.send(message);
		
		return authKey;
		//return "good";
		
	}
	
	// 여기서부터 member 권한이 있어야 접근이 가능합니다
	
	// 회원정보 보기전 비밀번호 확인 폼
	@GetMapping("/member/getInfo")
	public String getInfo() {
		return "/user/getInfo";
	}
	
	
	@PostMapping("/member/getInfo")
	public String getInfo(Long id, String username,String password, Model model) {
		int result = memberService.findByPassword(username, password);
		
		if (result != 1) {
			return null;
		}
		Member member = memberRepository.findById(id).get();
		model.addAttribute("member", member);
		return "/user/info";
	}

}
