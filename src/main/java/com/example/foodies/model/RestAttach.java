package com.example.foodies.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

// 식당에 들어갈 사진 테이블

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
@Entity
public class RestAttach {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "attach_id")
	private Long id;
	
	private String uuid;
	
	private String uploadpath;
	
	private String filename;
	
	@ManyToOne(cascade = CascadeType.ALL) // 레스토랑이 삭제되면 사진도 삭제됨
	@JoinColumn(name = "res_id")
	private Restaurant restaurant;
	
	//@Column(nullable = true) // 리뷰에 사진을 안올릴 수도 있으니까
	// 리뷰는 사진을 뭐..따로 뭐 그거할게 없다
	@ManyToOne // 레스토랑이 삭제되면 사진도 삭제됨
	@JoinColumn(name = "reviewboard_id")
	private ReviewBoard reviewBoard;

}
