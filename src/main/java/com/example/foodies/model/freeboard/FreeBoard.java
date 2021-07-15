package com.example.foodies.model.freeboard;

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

import com.example.foodies.model.member.Member;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


// 자유게시판!!
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
@Entity
@Table(name = "freeboard")
public class FreeBoard {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "freeboard_id")
	private Long id;
	
	private String title; // 제목
	@Lob
	private String content; // 내용
	
	private Integer replyCnt; // 댓글 // prePersist 이거 쓰려고 타입 변경했습니다 참고해주세요!
	
	private Integer clickCnt; // 조회수
	
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date regDate;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "member_id")
	private Member member; // 글쓴이
	
	@OneToMany(mappedBy = "freeBoard", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JsonIgnoreProperties("freeBoard") // 무한참조 방지
	private List<FreeComment> freeComment; // 댓글
	
	@PrePersist // db에 해당 테이블의 insert 연산 시 같이 실행
	public void prePersist() {
		this.clickCnt = this.clickCnt == null ? 0 : this.clickCnt;
		this.replyCnt = this.replyCnt == null ? 0 : this.replyCnt;
	}
}
