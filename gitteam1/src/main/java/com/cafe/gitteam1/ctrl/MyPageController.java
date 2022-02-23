package com.cafe.gitteam1.ctrl;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.cafe.gitteam1.reserve.CancelVo;
import com.cafe.gitteam1.reserve.MyPageBookingListService;
import com.cafe.gitteam1.reserve.MyPageBookingListVo;
import com.cafe.gitteam1.reserve.ReserveService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@RestController
public class MyPageController {
	Date tempNowDate = new Date(); 
	//원하는 데이터 포맷 지정 
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	String nowDate = simpleDateFormat.format(tempNowDate); 
	
	MyPageBookingListService service;
	IamportClient client;
	String id;
	String grade;
	String cafe_id;
	
	@Autowired
	public MyPageController(MyPageBookingListService service) {
		this.service = service;
	}

	@RequestMapping("dayOff")
	public ModelAndView dayOff() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage_cafe/dayOff");
		return mv;
	}
	
	@RequestMapping("/mypageBookingList")
	public ModelAndView booking_list(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		id = (String)session.getAttribute("member_id");
		grade = (String)session.getAttribute("grade");
		cafe_id = (String)session.getAttribute("cafe_id"); 
		try {
			List<MyPageBookingListVo>list = service.bookingList(id, nowDate, grade, cafe_id);
			mv.addObject("list",list);
			
			if(grade.equals("customer")) {
				mv.setViewName("myPage/bookingList");
			}else {
				mv.setViewName("myPage/bookingList_host");
			}
		}catch(Exception e) {
			mv.setViewName("member/signIn");
		}
		return mv;
	}
	@RequestMapping("/mypagePastBookingList")
	public ModelAndView pastBooking_list(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		id = (String)session.getAttribute("member_id");
		grade = (String)session.getAttribute("grade");
		cafe_id = (String)session.getAttribute("cafe_id");
		try {	
			List<MyPageBookingListVo> list = service.pastBookingList(id, nowDate, grade, cafe_id);
			mv.addObject("list",list);
			
			if(grade.equals("customer")) {
				mv.setViewName("myPage/bookingList");
			}else {
				mv.setViewName("myPage/bookingList_host");
			}
		}catch(Exception e) {
			mv.setViewName("member/signIn");
		}
		return mv;
	}
	
	@RequestMapping("/bookingListSearch")
	public ModelAndView booking_listSearch(HttpSession session, String findStr) {
		ModelAndView mv = new ModelAndView();
//		try {
			String status = "past";
			id = (String) session.getAttribute("member_id");
			grade = (String) session.getAttribute("grade");
			cafe_id = (String)session.getAttribute("cafe_id");
			List<MyPageBookingListVo> list = service.bookingListSearch(id, findStr, grade, cafe_id);
			mv.addObject("list",list);
			
			mv.addObject("past", status);
			if(grade.equals("customer")) {
				mv.setViewName("myPage/bookingList");
			}else {
				mv.setViewName("myPage/bookingList_host");
			}
//		}catch(Exception e) {
//			mv.setViewName("member/signIn");
//		}
		return mv;
	}
	@RequestMapping("/delClick")
	public ModelAndView delClick(CancelVo vo, HttpSession session) {
			ModelAndView mv = new ModelAndView();
			id = (String)session.getAttribute("member_id");
			grade = (String)session.getAttribute("grade");
			cafe_id = (String)session.getAttribute("cafe_id");
			
		try {
			if(vo.getUuid()!=null) {
			String token = testGetToken();
			testCancelPaymentAlreadyCancelledImpUid(vo.getUuid());
			}

			service.delClick(vo.getUuid());
			List<MyPageBookingListVo> list = service.bookingList(id, nowDate, grade, cafe_id);
			
			mv.addObject("list",list);
			mv.addObject("vo",vo);
			mv.setViewName("myPage/cancelResult");
		}catch(Exception e) {
			mv.setViewName("member/signIn");
		}
		return mv;
	}
//	@RequestMapping("/payCancel")
//	public ModelAndView payCancel(CancelVo vo, HttpSession session) {
//		ModelAndView mv = new ModelAndView();
//		id = (String)session.getAttribute("member_id");
//		grade = (String)session.getAttribute("grade");
//		try {
//			service.delClick(vo.getUuid());
//			List<MyPageBookingListVo> list = service.bookingList(id, nowDate, grade);
//			
//			mv.addObject("list",list);
//			mv.setViewName("myPage/payCancel");
//		}catch(Exception e) {
//			mv.setViewName("member/signIn");
//		}
//		return mv;
//	}
	@RequestMapping("/cupon")
	public ModelAndView cupon(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		try {
			String mid = (String)session.getAttribute("member_id");
			System.out.println(mid);
			int stampCnt = 0;// 현재 stamp수량 표시  
			stampCnt = service.stampCheck(mid);// Stamp 수량 확인
			mv.addObject("stampCnt", stampCnt);
			
			mv.setViewName("myPage/cupon");
		}catch(Exception e) {
			mv.setViewName("member/signIn");
		}
		return mv;
	}	
	
	// 현재는 필요없는 코드입니다. 
	public String testGetToken() {
		setup();
		String token="";
		try {
			IamportResponse<AccessToken> auth_response = client.getAuth();
			
			token = auth_response.getResponse().getToken();
		} catch (IamportResponseException e) {
			System.out.println(e.getMessage());
			
			switch(e.getHttpStatusCode()) {
			case 401 :
				break;
			case 500 :
				break;
			}
		} catch (IOException e) {
			//서버 연결 실패
			e.printStackTrace();
		}
		return token;
	}
	public void setup() {// import 기본세팅 
		String test_api_key = "2010333902159859";
		String test_api_secret = "8e05f41c2d497265da32f8ad6b9a5a94f61eb12e1686ead3bf97a01d43e8b77c063452eaa35539b0";
		client = new IamportClient(test_api_key, test_api_secret);//import 가입시 제공되는 rest api key를 클라이언트에게 전송 
	}
	
	// 전액취소 요청하기 
	public void testCancelPaymentAlreadyCancelledImpUid(String uuid) {
		CancelData cancel_data = new CancelData(uuid, false); //imp_uid를 통한 전액취소
		try {
			IamportResponse<Payment> payment_response = client.cancelPaymentByImpUid(cancel_data);
			payment_response.getResponse();
		} catch (IamportResponseException e) {
			System.out.println(e.getMessage());
			switch(e.getHttpStatusCode()) {
			case 401 :
				break;
			case 500 :
				break;
			}
		} catch (IOException e) {
			e.printStackTrace();
			
		}
	}

}
