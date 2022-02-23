package com.cafe.gitteam1.ctrl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.cafe.gitteam1.reserve.ReserveVo;
import com.cafe.gitteam1.sale.SaleService;
import com.cafe.gitteam1.sale.SaleVo;

@RestController
public class SaleController {
	@Autowired
	SaleService service;
	
	List<ReserveVo> list = null;
	
	@RequestMapping("salesStatus")
	public ModelAndView salesStatus(SaleVo vo) {
		ModelAndView mv = new ModelAndView();
		Date now = new Date();
		SimpleDateFormat yearFormat = new SimpleDateFormat("yyyy");
		SimpleDateFormat monthFormat = new SimpleDateFormat("MM");	
		vo.setSale_year(yearFormat.format(now));
		vo.setSale_month(monthFormat.format(now));
		list = service.selectYear(vo);
		mv.addObject("list",list);
		mv.setViewName("sale/salesStatus");
		return mv;
	}
	@RequestMapping("selectYear")
	public ModelAndView selectYear(SaleVo vo) {
		ModelAndView mv = new ModelAndView();
		list = service.selectYear(vo);
		mv.addObject("list",list);
		mv.setViewName("sale/salesStatus");
		return mv;
	}
	/*
	@RequestMapping("chart")
	public ModelAndView chart() {
		ModelAndView mv = new ModelAndView();
		list = service.chart();
		mv.addObject("list",list);
		mv.setViewName("sale/salesStatus");
		return mv;
	}
	*/
	@RequestMapping("chart")
	public @ResponseBody List<ReserveVo> chart() throws Exception{
		ModelAndView mv = new ModelAndView();
		list = service.chart();
		mv.addObject("list",list);
		return list;
	}
}
