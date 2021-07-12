package com.example.foodies.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;


// 자유게시판!!
@Data
@Entity
@Table(name = "freeboard")
public class FreeBoard {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "freeboard_id")
	private Long id;
	
	private String title;
	@Lob
	private String content;
	
	private Integer replyCnt; // prePersist 이거 쓰려고 타입 변경했습니다 참고해주세요!
	
	private Integer clickCnt;
	
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date regDate;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "member_id")
	private Member member;
	
	@OneToMany(mappedBy = "freeBoard", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JsonIgnoreProperties("freeBoard") // 무한참조 방지
	private List<FreeComment> freeComment;
	
	@PrePersist // db에 해당 테이블의 insert 연산 시 같이 실행
	public void prePersist() {
		this.clickCnt = this.clickCnt == null ? 0 : this.clickCnt;
		this.replyCnt = this.replyCnt == null ? 0 : this.replyCnt;
	}
}
