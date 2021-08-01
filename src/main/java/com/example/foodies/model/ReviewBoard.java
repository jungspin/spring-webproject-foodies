package com.example.foodies.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

import com.example.foodies.model.member.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
@Entity
@Table(name = "reviewboard")
public class ReviewBoard {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "reviewboard_id")
	private Long id;

	@ManyToOne
	@JoinColumn(name = "res_id")
	private Restaurant restaurant; // 해당 식당 (식별) 정보

	@Lob
	private String content; // 리뷰내용

	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	private Date regDate;
	
	private Double grade; // 별점 -> 숫자타입으로 바꿔야할듯! for 평균내려고

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "member_id")
	private Member member; // 리뷰 글쓴이
	
	// 사진등록 -> 사진을 식당상세보기 시 보이게하고 싶으면 어떡해야할까?
	
}
