package com.example.foodies.model.freeboard;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

// 자유게시판에 들어갈 사진 테이블

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
@Entity
public class FreeAttach {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "free_attach_id")
	private Long id;
	
	private String uuid;
	
	private String uploadpath;
	
	private String filename;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "freeboard_id")
	private FreeBoard freeBoard;
	


}
