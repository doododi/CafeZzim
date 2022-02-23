package com.cafe.gitteam1.ctrl;

import java.io.PrintWriter;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.cafe.gitteam1.reserve.ReserveService;
import com.cafe.gitteam1.reserve.ReserveVo;

@RestController
public class BookSuccessController {
	@Autowired
	ReserveService service;

	
	PrintWriter out;
	boolean b = false;


	
	@RequestMapping(value="booksuccess", method= {RequestMethod.POST})
	public ModelAndView booksuccess(ReserveVo vo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		int stampCnt = 0;// 남은 stamp수량 표시  
		int cupon =0; // 지급된 쿠폰 수 
		try {
			b=service.reserveResult(vo);
			vo.setMember_id((String)session.getAttribute("member_id")); 
			if(vo.getCuponSN()>0) {
				service.cuponUse(vo.getCuponSN());//쿠폰사용처리
			}
			if(vo.getPayment_price()>0) {
				service.stamp(vo);// Stamp 추가			
			}
			stampCnt = service.stampCheck((String)session.getAttribute("member_id"));// Stamp 수량 확인
			System.out.println(stampCnt);
			if(stampCnt>=10) {
				System.out.println("if문 동작!!!");
				for(int i=stampCnt;i>=10;i=i-10) {
				service.cuponInsert((String)session.getAttribute("member_id")); // 쿠폰 발행 
				service.stampReset((String)session.getAttribute("member_id")); // 스탬프 10개 빼기 
				System.out.println("for문 동작!!!");
				cupon=cupon+1;
				}
			}
			//service.stampReset((String)session.getAttribute("member_id"));
			stampCnt = service.stampCheck((String)session.getAttribute("member_id"));
			
			mv.addObject("giveStamp", vo.getOrderCnt());
			mv.addObject("stamp", stampCnt);
			mv.addObject("cupon", cupon); 
			mv.setViewName("book/bookSuccess");
		}catch(Exception e) {
			mv.setViewName("member/signIn");
		}
		return mv;
	}
	
}
