package com.example.foodies.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.foodies.model.member.Member;

public interface MemberRepository extends JpaRepository<Member, Long>{
	
	Member findByUsername (String username);
	
	//Member findByPassword (String password);

}
