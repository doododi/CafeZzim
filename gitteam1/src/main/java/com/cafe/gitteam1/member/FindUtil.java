package com.cafe.gitteam1.member;

import java.util.UUID;

public class FindUtil {

	public static String getNewPassword() throws Exception {
		String tempPw = UUID.randomUUID().toString().replaceAll("-", "");
		tempPw = tempPw.substring(0, 10);

		return tempPw;
	}
}