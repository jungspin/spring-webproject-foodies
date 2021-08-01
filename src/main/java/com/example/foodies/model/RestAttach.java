package com.example.foodies.model;

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
	
	@ManyToOne // 레스토랑이 삭제되면 사진도 삭제됨
	@JoinColumn(name = "res_id")
	private Restaurant restaurant;
	
	// 리뷰에 대한 정보가 들어갈 필요가 없..을거같은데..내가 쓴 리뷰..이런거 볼거면..어 필요한가..
	private Long reviewboardId; // 굳이 리뷰보드 통째로 들어갈 이유가 없음

	@Override
	public String toString() {
		return "RestAttach [id=" + id + ", uuid=" + uuid + ", uploadpath=" + uploadpath + ", filename=" + filename
				+ "]";
	}
	
	
	
	
}
