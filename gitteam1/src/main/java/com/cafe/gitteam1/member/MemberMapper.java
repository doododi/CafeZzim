package com.cafe.gitteam1.member;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface MemberMapper {
	// 로그인
	public String signInCheck(MemberVo vo);	
	public MemberVo viewMember(MemberVo vo);

	// 아이디 찾기
	public MemberVo searchId(MemberVo vo);
	public String viewId(MemberVo vo);
	
	// 비밀번호 찾기
	public MemberVo searchPw(MemberVo vo);
	public boolean changePw(String newPassword, String member_id);
	
	// 카카오 로그인
	public MemberVo findKakao(HashMap<String, Object> userInfo);
	public void kakaoInsert(HashMap<String, Object> userInfo);
	
	// 자동 로그인
	public boolean autoLogin(Map<String, Object> data);
	public MemberVo selectSession(String session_id);
}
