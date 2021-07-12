package com.example.foodies.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration 
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	// 암호화를 위한 객체
	@Bean
	public BCryptPasswordEncoder encodedPw() {
		return new BCryptPasswordEncoder();
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable();
		http.authorizeRequests()
			.mvcMatchers("/", "/board/*", "/login").permitAll() // 해당 요청 모두 허용
			.mvcMatchers(HttpMethod.POST, "/login").permitAll() // 해당 요청 모두 허용
			.mvcMatchers("/manager/*").hasAuthority("ROLE_Manager") // 해당 요청은 해당 권한을 가지고 있어야 허용
			.mvcMatchers("/member/*").hasAuthority("ROLE_Member");
		
		http.formLogin()
			.loginPage("/login") // 사용할 페이지 -> jsp 파일명 아님 요청주소임
			.permitAll()
			.loginProcessingUrl("/loginProc") // 액션 이름 메소드는 post
			.defaultSuccessUrl("/"); // 성공하면 이 경로로 가라
		
		http.logout()
			.logoutUrl("/logout")
			.logoutSuccessUrl("/")
			.invalidateHttpSession(true);
			
	}
}
