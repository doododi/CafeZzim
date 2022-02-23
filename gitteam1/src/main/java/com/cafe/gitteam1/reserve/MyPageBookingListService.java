package com.cafe.gitteam1.reserve;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

@Service
@Transactional
public class MyPageBookingListService {
	
	@Autowired
	MyPageBookingListMapper mapper;
	
	@Autowired
	PlatformTransactionManager manager; 
	
	TransactionStatus status;
	
	
	
	// 예약리스트 표시 
	public List<MyPageBookingListVo> bookingList(String id, String nowDate, String member_grade, String cafe_id) {

	//	status = manager.getTransaction(new DefaultTransactionDefinition()); select 빼고 다필요함 
		List<MyPageBookingListVo> listVo;
		System.out.print("member_grade" +member_grade);

		if(member_grade.equals("master")) {
			listVo = mapper.myPageBookingListM(id, nowDate);
			System.out.print("BookingListM");
		}else if(member_grade.equals("cafehost")){
			listVo = mapper.myPageBookingListH(cafe_id, nowDate);
			System.out.print("BookingListH");
		}else {
			listVo = mapper.myPageBookingListC(id, nowDate);
			System.out.print("BookingListC");
			System.out.print("member_grade" +member_grade);

		}
		
		return listVo;
	}

	// 이전 예약리스트 표시 
	public List<MyPageBookingListVo> pastBookingList(String id, String nowDate, String member_grade, String cafe_id) {
		//status = manager.getTransaction(new DefaultTransactionDefinition());
		List<MyPageBookingListVo> listVo;
		if(member_grade.equals("master")) {
			listVo = mapper.myPagePastBookingListM(id, nowDate);
			System.out.print("pastBookingListM");
			
		}else if(member_grade.equals("cafehost")){
			listVo = mapper.myPagePastBookingListH(cafe_id, nowDate);
			System.out.print("pastBookingListH");
		}else {
			listVo = mapper.myPagePastBookingListC(id, nowDate);
			System.out.print("pastBookingListC");
		}
		
		return listVo;
	}
	
	// 예약내역 검색  
	public List<MyPageBookingListVo> bookingListSearch(String id, String findStr, String member_grade, String cafe_id) {
		//status = manager.getTransaction(new DefaultTransactionDefinition());
		List<MyPageBookingListVo> listVo;// = mapper.bookingListSearch(id, findStr);
		
		if(member_grade.equals("master")) {
			listVo = mapper.bookingListSearchM(id, findStr);
		}else if(member_grade.equals("cafehost")){
			listVo = mapper.bookingListSearchH(cafe_id, findStr);
		}else {
			listVo = mapper.bookingListSearchC(id, findStr);
		}
		
		return listVo;
	}
	
	// 예약 삭제  
	public void delClick(String rid) {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		mapper.delClick(rid);
	}
	// 쿠폰 환불
	public void cuponUsed(int cuponSN) {
		status = manager.getTransaction(new DefaultTransactionDefinition());

		mapper.cuponUsed(cuponSN);
	}
	// stamp 확인
	public int stampCheck(String mid) {
		int stampCnt = 0;
		stampCnt = mapper.stampCheck(mid);
		
		return stampCnt;
	}
}
