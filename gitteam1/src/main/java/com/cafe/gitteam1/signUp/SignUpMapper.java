package com.cafe.gitteam1.signUp;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.cafe.gitteam1.member.MemberVo;

@Repository
@Mapper
public interface SignUpMapper {
	public int join(MemberVo vo);
	public int idCheck(String findStr);
	public int emailCheck(String findStr);
	public List<MemberVo> searchMember(String findStr);
	public MemberVo searchMemberView(String mid);
	public int memberModify(MemberVo vo);
	public int memberCancel(MemberVo vo);
}
