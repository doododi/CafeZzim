package com.cafe.gitteam1.member;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class SessionConfig implements HttpSessionListener {

	private static final Map<String, HttpSession> sessions = new ConcurrentHashMap<>(); // 세션을 담을 객체
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		sessions.put(se.getSession().getId(), se.getSession()); // getId 메소드는 해당 세션의 고유 키값
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		sessions.get(se.getSession().getId()).invalidate();
		sessions.remove(se.getSession().getId());
	}
	
	// 해당 메소드는 로그인 하는 곳에서 호출하는 메소드이다.
	public synchronized static String loginSessionChecker(String compareId) {
		String result = "";
		for(String key :sessions.keySet()) {
			HttpSession value = sessions.get(key);
			if(value != null && value.getAttribute("member_id") != null && value.getAttribute("member_id").toString().equals(compareId)) {
				result = key.toString();
			}
		}
		removeSessionForDoubleLogin(result);
		return result;
	}
	
	public static boolean removeSessionForDoubleLogin(String member_id) {
		if(member_id != null && member_id.length() > 0) {
			sessions.get(member_id).invalidate();
			sessions.remove(member_id);
		}
		return true;
	}
}
