package com.example.foodies.model;

import java.util.Date;
import java.util.List;

import javax.annotation.Generated;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;
@Entity
@Table(name="freeboard")
public class FreeBoard {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="freeboard_id")
private Long id;
	@Lob
private String content;
private int replyCnt;
private int clickCnt;
@CreationTimestamp
@Temporal(TemporalType.TIMESTAMP)
private Date regDate;
@ManyToOne
@JoinColumn(name="member_id")
private Member member;
@OneToMany(mappedBy = "freeBoard")
private List<FreeComment> freeComment;
}
