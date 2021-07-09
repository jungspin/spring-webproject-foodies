package com.example.foodies.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
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

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "reviewboard")
public class ReviewBoard {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "reviewboard_id")
	private Long id;

	@ManyToOne
	@JoinColumn(name = "res_id")
	private Restaurant restaurant;

	@Lob
	private String content;

	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	private Date regDate;

	@Enumerated(EnumType.STRING)
	private Grade grade;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "member_id")
	private Member member;

	@OneToMany(mappedBy = "reviewBoard", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JsonIgnoreProperties("reviewBoard")
	private List<ReviewComment> reviewComment;

}
