package com.cafe.gitteam1.reserve;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.cafe.gitteam1.search.CafeInfoVo;
import com.cafe.gitteam1.search.MenuVo;

@Mapper
@Repository
public interface ReserveMapper {
//	// MemberService에서 사용
	
	public List<MenuVo> orderMenu(String cid);
	public CafeInfoVo viewCafe(String cid);
	public int loadCupon(String mid);
	public List<CuponVo> cuponList(String mid);
	
	public boolean reserveResult(ReserveVo vo);
	public boolean stamp(ReserveVo vo);
	public int stampCheck(String mid);
	public boolean cuponInsert(String mid);
	public boolean stampReset(String mid);
	public void cuponUse(int cuponSN);
	
//  예약 가능한 업무 시간의 수 조회
	public ReserveTimeVo workTime(ReserveVo vo);
//	예약할 날짜가 휴일인지 체크 2022.01.24 김성겸
	public ReserveTimeVo offChk(ReserveVo vo);
//	예약 가능 시간 조회 2022.01.24 김성겸
	public String viewTimeTable(ReserveVo vo);
	
//  예약 가능 자리 체크
	public ReserveTimeVo viewAvailSeats(ReserveVo vo);

//	public void signOut(HttpSession session);
//	
//	// xml(SQL)에서 사용
	//public ReserveVo reserveResultXml(ReserveVo vo);
//	public PayVo viewMember(PayVo vo);
	
}
