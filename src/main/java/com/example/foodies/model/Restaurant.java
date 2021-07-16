package com.example.foodies.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
public class Restaurant {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "res_id")
	private Long id;

	private String addr1; // 주소	
	private String cntctTel; // 전화번호
	@Lob
	private String itemcntnts; // 식당소개
	private String mainTitle; // 식당이름
	@Column(nullable = true)
	private String mainImgNormal; // 메인이미지 -> 일단 api 데이터 사진은 여기 담아야할듯 ㅠㅠ
	@Column(nullable = true)
	private String mainImgThumb; // 썸네일이미지
	private String rprsntvMenu; // 대표메뉴

	@Column(length = 500)
	private String usageDayWeekAndTime; // 영업시간
	
	@OneToMany(mappedBy = "restaurant", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JsonIgnoreProperties("restaurant") // 무한참조 방지
	private List<ReviewBoard> reviewBoards;
	
	
}
