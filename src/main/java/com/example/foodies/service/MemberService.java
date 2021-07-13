package com.example.foodies.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.foodies.model.member.Member;
import com.example.foodies.model.member.Role;
import com.example.foodies.repository.MemberRepository;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class MemberService {
	
	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	// 아이디 중복검사를 위함
	public int findByUsername(String username) {
		Member member = memberRepository.findByUsername(username);
		//System.out.println(member);
		if (member != null) {
			return 1; // 아이디 있는 경우
		}
		
		return -1; // 아이디 없는 경우
	}
	
	// 회원가입
	@Transactional
	public void register(Member member) {
		// 비밀번호 암호화
		String rawPW = member.getPassword();
		String encPW = encoder.encode(rawPW);
		
		member.setPassword(encPW);
		
		// 권한 부여
		// 관리자계정의 username에는 admin뭐시기 가 들어간다고 가정
		if (!member.getUsername().contains("admin")) { 
			member.setRole(Role.ROLE_Manager);
		}
		
		member.setRole(Role.ROLE_Member);
		
		//System.out.println("new : " + member);
		
		memberRepository.save(member);
	}
	
	// 비밀번호 찾기?
	public int findByPassword(String username,String password) {
		//System.out.println(username);
		Member member = memberRepository.findByUsername(username);
		//System.out.println(password);
		//System.out.println(member.getPassword());
		//System.out.println(encoder.matches(password, member.getPassword()));
		
		
		if (!encoder.matches(password, member.getPassword())) {
			return -1; // 비밀번호 불일치
		}
		
		return 1; // 비밀번호 일치
	}
	
	//멤버 찾기 
	@Transactional
	public Page<Member> findAll(Pageable pageable) {
		
		return memberRepository.findAll(pageable);
	}
	
	// 아이디로 찾기
	public Member findById(Long id) {
		return memberRepository.findById(id).get();
	}
	
	

}
