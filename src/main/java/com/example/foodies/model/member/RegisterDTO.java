package com.example.foodies.model.member;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class RegisterDTO {

	//@NotBlank(message = "성별에 체크해주세요")
	private Boolean gender;

	@NotBlank
	@Size(min = 4, max = 10, message = "아이디는 4~10자리 입니다")
	@Pattern(regexp = "^[a-z0-9]{4,10}$", message = "아이디는 영어소문자, 숫자를 포함한 4~10자리 입니다")

	private String username;

	@NotBlank
	@Pattern(regexp = "^.*(?=^.{8,20}$)(?=.*\\d)(?=.*[a-z])(?=.*[!@#$%^&+=]).*$", message = "비밀번호는 영어소문자, 숫자, 특수문자를 포함한 8~20자리 입니다")
	private String password;

	@NotBlank
	@Pattern(regexp = "[a-zA-z0-9]+@[a-zA-z]+[.]+[a-zA-z.]+", message = "이메일 양식을 입력하세요")
	private String email;

	//@NotBlank(message = "나이에 체크해주세요")
	private age age;
	
	public Member toEntity() {
		return Member.builder()
					.username(username)
					.password(password)
					.email(email)
					.gender(gender)
					.age(age)
					.build();
	}

	
}
