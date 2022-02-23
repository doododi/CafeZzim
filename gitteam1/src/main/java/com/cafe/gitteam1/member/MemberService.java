package com.cafe.gitteam1.member;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.cafe.gitteam1.signUp.AES;

@Service
@Transactional
public class MemberService {

	@Autowired
	MemberMapper mapper;

	@Autowired
	AES aes;
	
	@Autowired
	PlatformTransactionManager manager;

	TransactionStatus status;

	// ------------------------ 로그인 -----------------------------
	public boolean signInCheck(MemberVo vo, HttpSession session) {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		boolean isSignIn = false;
		
		try {
			vo.setPassword(aes.encrypt(vo.getPassword()));
			String name = mapper.signInCheck(vo);
			MemberVo vo2 = mapper.viewMember(vo);
			
			if(name != null) {
				if(vo2.getMember_grade().equals("leaver")) {
					isSignIn = false;
				} else {
					manager.commit(status);
					session.setAttribute("member_id", vo2.getMember_id());
					session.setAttribute("name", vo2.getMember_name());
					session.setAttribute("grade", vo2.getMember_grade());
					session.setAttribute("phone", vo2.getMember_phone());
					session.setAttribute("cafe_id", vo2.getCafe_id());
					
					isSignIn = true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSignIn;
	}
	
	// ----------------------- 아이디 찾기 ----------------------------
	public boolean searchId(MemberVo vo) {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		boolean isSearchId = false;
		MemberVo vo2 = mapper.searchId(vo);
		String member_id = vo2.getMember_id();
		String member_grade = vo2.getMember_grade();

		try {
			if(!(member_grade.equals("leaver"))) {
				if(member_id != null) {
					manager.commit(status);
					isSearchId = true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSearchId;
	}
	
	public String viewId(MemberVo vo) {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		String member_id = mapper.viewId(vo);
		
		try {
			if(member_id != null) {
				manager.commit(status);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return member_id;
	}
	
	// ----------------------- 비밀번호 찾기 ---------------------------
	public boolean searchPw(MemberVo vo) {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		MemberVo vo2 = mapper.searchPw(vo);
		String pwCheck = vo2.getPassword();
		String member_grade = vo2.getMember_grade();
		boolean isPwCheck = false;
		try {
			if(!(member_grade.equals("leaver"))) {
				if(pwCheck != null) {
					manager.commit(status);
					isPwCheck = true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return isPwCheck;
	}
	
	// ----------------------- 비밀번호 변경 ---------------------------
	public boolean changePw(String newPassword, String member_id) {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		boolean isChangePw = false;
		newPassword = aes.encrypt(newPassword);
		boolean result = mapper.changePw(newPassword, member_id);

		try {
			if(result) {
				isChangePw = true;
				manager.commit(status);
			} else {
				manager.rollback(status);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isChangePw;
	}
	
	// ----------------------- 자동 로그인 ---------------------------
	public void autoLogin(String session_id, Date limit_date, String member_id) {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		Map<String, Object> data = new HashMap<>();
		data.put("session_id", session_id);
		data.put("limit_date", limit_date);
		data.put("member_id", member_id);
		
		boolean isAutoLogin = mapper.autoLogin(data);

		try {
			if(isAutoLogin) {
				manager.commit(status);
			} else {
				manager.rollback(status);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public MemberVo selectSession(String session_id) {
		return mapper.selectSession(session_id);
	}
} 