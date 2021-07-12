package com.example.foodies.config.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.foodies.model.member.Member;
import com.example.foodies.repository.MemberRepository;

@Service
public class PrincipalDetailService implements UserDetailsService{
	
	@Autowired
	private MemberRepository memberRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("loadUserByUsername");
		Member member = memberRepository.findByUsername(username); // 쿼리메소드
		//System.out.println("member : " + member);
		
		if ( member == null) return null;
		
		// 시큐리티가 가지는 user로 바꿔줘야함
		PrincipalDetails principal = new PrincipalDetails(member);
		
		return principal;
	}

}
