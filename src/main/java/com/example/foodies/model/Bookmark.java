package com.example.foodies.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.example.foodies.model.member.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

// 관심등록을 위한 테이블입니다

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
@Entity
public class Bookmark {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "bookmark_id")
	private Long id;
	
	
	@ManyToOne(cascade = CascadeType.REMOVE, fetch = FetchType.LAZY) // 자동으로 삭제됨
	@JoinColumn(name = "member_id")
	private Member member;
	
	// 회원이 찜한 식당의 정보
	@ManyToOne(cascade = CascadeType.REMOVE, fetch = FetchType.LAZY) // 식당 정보가 삭제되면 자동으로 삭제됨
	@JoinColumn(name = "res_id")
	private Restaurant restaurant;
	

}
