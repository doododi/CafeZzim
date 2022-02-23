package com.cafe.gitteam1.member;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class KakaoConfig {
	@Bean
	public KakaoAPI getKakaoAPI() {
		return new KakaoAPI();
	}
}
