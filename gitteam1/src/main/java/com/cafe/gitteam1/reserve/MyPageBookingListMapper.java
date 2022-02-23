package com.cafe.gitteam1.reserve;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface MyPageBookingListMapper {
	public List<MyPageBookingListVo> myPageBookingListM(String id, String nowDate);
	public List<MyPageBookingListVo> myPageBookingListH(String id, String nowDate);
	public List<MyPageBookingListVo> myPageBookingListC(String id, String nowDate);
	
	public List<MyPageBookingListVo> myPagePastBookingListM(String id, String nowDate);
	public List<MyPageBookingListVo> myPagePastBookingListH(String id, String nowDate);
	public List<MyPageBookingListVo> myPagePastBookingListC(String id, String nowDate);
	
	public List<MyPageBookingListVo> bookingListSearchM(String id, String findStr);
	public List<MyPageBookingListVo> bookingListSearchH(String id, String findStr);
	public List<MyPageBookingListVo> bookingListSearchC(String id, String findStr);
	
	public void delClick(String rid);
	public int stampCheck(String mid);
	public void cuponUsed(int cuponSN);

}
