package com.cafe.gitteam1.signUp;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MemberConfig {
	@Bean
	public AES getAes() {
		return new AES();
	}
}
