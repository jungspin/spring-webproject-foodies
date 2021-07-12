package com.example.foodies.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
@Entity
public class Member {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "member_id")
	private Long id;

	// boolean 으로 하자고 했었지?
	// true, false 형태로 들어가야함!!
	@Column(nullable = false)
	private Boolean gender;

	@NotEmpty
	@Size(min = 4, max = 8 )
	@Column(nullable = false)
	private String username;

	@NotEmpty
	@Column(nullable = false)
	private String password;

	@NotEmpty
	@Email
	@Column(nullable = false)
	private String email;

	@Enumerated(EnumType.STRING)
	private age age;

	@Enumerated(EnumType.STRING)
	private Role role; // 권한

}
