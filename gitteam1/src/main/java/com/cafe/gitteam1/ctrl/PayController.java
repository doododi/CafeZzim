package com.cafe.gitteam1.ctrl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.cafe.gitteam1.reserve.CuponVo;
import com.cafe.gitteam1.reserve.ReserveService;
import com.cafe.gitteam1.reserve.ReserveTimeVo;
import com.cafe.gitteam1.reserve.ReserveVo;
import com.cafe.gitteam1.search.CafeInfoVo;
import com.cafe.gitteam1.search.MenuVo;
import com.google.gson.Gson;

@RestController
public class PayController {
	
	ReserveService service;
	
	@Autowired
	public PayController(ReserveService service) {
		this.service = service;
	}
	
	@RequestMapping("/booking")
	public ModelAndView booking() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("pay/booking");
		return mv;
	}
	
	@GetMapping("order")
	public ModelAndView order(String id, String date, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		ReserveVo vo = new ReserveVo();
		
		//원하는 데이터 포맷 지정 
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date nowDate = new Date();
		
		if(date == null || date.equals("")) {
			date = simpleDateFormat.format(nowDate);
		}
		
		vo.setCafe_id(Integer.parseInt(id));
		vo.setReserve_date(date);
		
		List<ReserveTimeVo> timetbl = service.viewTimeTable(vo);


		
		String mid = (String)session.getAttribute("member_id");
		try {
			List<MenuVo> menu = service.orderMenu(id);
			CafeInfoVo cinfo = service.viewCafe(id);
			int cupon = service.loadCupon(mid);
			List<CuponVo> cuponList = service.cuponList(mid);
			
			// 예약 날짜 확인 추가 2022.01.26 김성겸
			mv.addObject("date",date);
			mv.addObject("timetbl",timetbl);
			mv.addObject("cuponList", cuponList);
			mv.addObject("cupon", cupon);
			mv.addObject("cvo",cinfo);
			mv.addObject("menu",menu);
			mv.setViewName("pay/order");
		}catch(Exception e) {
			mv.setViewName("member/signIn");
		}
		
		
		
		
		
		return mv;
	}
	
	@RequestMapping(value = "/viewSeats", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String searchJson(ReserveVo vo){
		ReserveTimeVo ci = service.viewAvailSeats(vo);
		Gson gson = new Gson();
		return gson.toJson(ci);
	}

	
}
