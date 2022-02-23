package com.cafe.gitteam1.ctrl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.cafe.gitteam1.search.CafeInfoVo;
import com.cafe.gitteam1.search.MenuVo;
import com.cafe.gitteam1.search.ReviewVo;
import com.cafe.gitteam1.search.SearchService;
import com.cafe.gitteam1.search.SearchVo;
import com.cafe.gitteam1.search.ZzimVo;
import com.google.gson.Gson;

@RestController
public class SearchController {
	
	SearchService service;
	
	@Autowired
	public SearchController(SearchService service) {
		this.service = service;
	}
	
	@RequestMapping("search")
	public ModelAndView search(SearchVo search) {
		ModelAndView mv = new ModelAndView();
		List<CafeInfoVo> list = null;
		
		double lat = search.getCenterLat()>0 ? search.getCenterLat() : 37.481269577088455;
		double lng = search.getCenterLng()>0 ? search.getCenterLng() : 126.95272272692208;
		search.setCenterLat(lat);
		search.setCenterLng(lng);
		
		list = service.cafeSearch(search);
		
		mv.addObject("list",list);
		mv.addObject("find",search.getFindStr());
		mv.addObject("date",search.getDate());
		mv.setViewName("search/searchResult");
		
		return mv;
	}
	
	@RequestMapping(value = "/searchJson", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String searchJson(SearchVo search){
		List<CafeInfoVo> list = service.cafeSearch(search);
		
		Gson gson = new Gson();
		
		return gson.toJson(list);
	}
	
	@GetMapping("view")
	public ModelAndView view(String id, String date, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String mid = "";
		
		if(session.getAttribute("member_id") != null) {
			mid = (String) session.getAttribute("member_id");
		}
		
		CafeInfoVo vo = service.viewCafe(id);
		List<String> photos = service.viewOtherPhoto(id);
		List<ReviewVo> review = service.viewReview(id);
		List<MenuVo> menu = service.viewMenu(id);
		
		vo.setPhotos(photos);
		ZzimVo zzim = new ZzimVo();
		zzim.setMid(mid);
		zzim.setCid(Integer.parseInt(id));
		String className = service.zzimCafe(zzim);
		if(className == null) {
			className = "far";
		}
		
		mv.addObject("date",date);
		mv.addObject("vo",vo);
		mv.addObject("review",review);
		mv.addObject("menu",menu);
		mv.addObject("className",className);
		mv.setViewName("search/viewDetail");
		
		return mv;
	}
	
	
	@GetMapping("map")
	public ModelAndView map(String findStr) {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("search/searchMap");
		mv.addObject("find",findStr);
		return mv;
	}
	
	@RequestMapping(value = "/autocomplete", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String json(String findStr) {
		List<String> list = service.cafeFindName(findStr);
	    
        Gson gson = new Gson();

	    return gson.toJson(list);
	}
	
	
	@RequestMapping(value = "/mapJson", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String mapJson(SearchVo search) {
		search.setListSize(10);
		
		List<CafeInfoVo> list = service.cafeSearch(search);
		
		Gson gson = new Gson();
		
		return gson.toJson(list);
	}
	
	@PostMapping(value="zzimIns")
	public String zzimIns(ZzimVo vo) {
		boolean b = false;
		try {
			b = service.zzimIns(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return b + "";
	}
	
	@PostMapping(value="zzimDel")
	public String zzimDel(ZzimVo vo) {
		boolean b = false;
		try {
			b = service.zzimDel(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return b + "";
	}

}
