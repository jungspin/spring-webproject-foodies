package com.example.foodies.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
public class Member {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name= "member_id")
	private Long id;
	@Column(nullable = false)
	private Boolean gender;
	@Column(nullable = false)
	private String username;
	@Column(nullable = false)
	private String password;
	@Column(nullable = false)
	private String email;
	@Enumerated(EnumType.STRING)
	private age age;
	@Enumerated(EnumType.STRING)
	private Role role;
	
}
