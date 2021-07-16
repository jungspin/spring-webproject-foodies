package com.example.foodies.model.member;

import lombok.Data;

@Data
public class LoginReqDTO {

	private Long id;
	private String username;
	private String password;
}
