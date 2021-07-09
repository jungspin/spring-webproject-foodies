package com.example.foodies.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;

import lombok.Data;

@Data
@Entity
public class Restaurant {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "res_id")
	private Long id;
	
	private String addr1; // 주소
	@Column(length = 10)
	//private String addr2;
	//private String gugunNm;
	//private String hompageUrl;
	private String cntctTel; // 전화번호
	@Lob
	private String itemcntnts; // 식당소개
	private int lat; // 타입 맞나? // 좌표
	private int lng;
	private String mainImgNormal; // 메인이미지
	private String mainImgThumb; // 썸네일이미지
	private String mainTitle; // 식당이름
	//private String place;
	private String rprsntvMenu; // 대표메뉴
	
	//private String subtitle;
	//private int ucSeq;
	private String usageDayWeekAndTime; // 영업시간
}
