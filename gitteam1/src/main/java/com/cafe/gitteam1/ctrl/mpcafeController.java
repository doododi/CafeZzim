package com.cafe.gitteam1.ctrl;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.cafe.gitteam1.mypage_cafe.dayoffVo;
import com.cafe.gitteam1.mypage_cafe.mpcafeService;
import com.cafe.gitteam1.mypage_cafe.mpcafeVo;
import com.cafe.gitteam1.mypage_cafe.mpcafe_listVo;

@RestController
public class mpcafeController {
	
	@Autowired
	private mpcafeService service;
	
	PrintWriter out;
	mpcafeVo vo = null;
	mpcafe_listVo lvo = null;
	dayoffVo dvo = null;
	String findStr = "";
	String cafe_id = "";
	boolean b = false;
	public static String uploadPath="/home/hosting_users/gitteam1/tomcat/webapps/upload/";
	
	@RequestMapping(value="/cafemanage", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView cafemanage(String findStr, HttpSession session) {
		ModelAndView mv = new ModelAndView();
	if(session.getAttribute("grade").equals("master")) {
		List<mpcafeVo> list = service.search(findStr);
		mv.addObject("list", list);
		mv.setViewName("/mypage_cafe/cafemanage");		
	} else {
		mv.setViewName("redirect:/");
	}return mv;
	}		
	
	@RequestMapping(value="/cafeupdate", method=RequestMethod.GET)
	public ModelAndView cafeupdate(@RequestParam String cafe_id) throws Exception{
		vo = service.view(cafe_id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);

		mv.setViewName("mypage_cafe/cafeupdate");
		return mv;
	}
	
	@RequestMapping("cafeupdateSave")
	public ModelAndView cafeupdateSave(String cafe_id, HttpServletResponse resp,
			@RequestParam("search_name") List<String> mul,
			@ModelAttribute mpcafeVo vo) {
		
		ModelAndView mv = new ModelAndView();
		List<mpcafe_listVo> cafesearch = new ArrayList<mpcafe_listVo>();
		
		b = service.modify(vo);
		String msg = "";
			if(b) {							
					for(String m : mul) {
						mpcafe_listVo lvo = new mpcafe_listVo();
						lvo.setSearch_name(m);
						lvo.setCafe_id(cafe_id);
						cafesearch.add(lvo);
					}
						vo.setCafesearch(cafesearch);
						boolean c = service.scnmodify(vo);	
						if(c) {
							msg="카페정보 수정이 완료되었습니다.";		
						}else {
							msg="카페정보 수정중 오류가 발생했습니다. 다시 시도해주세요";
						}
			}else {
				msg="카페정보 수정중 오류가 발생했습니다. 다시 시도해주세요";
			}
			mv.addObject("vo", vo);
			mv.addObject("msg", msg);
			mv.setViewName("mypage_cafe/mpcafe_result");
			return mv;
	}
		
	
	@RequestMapping(value="/dayOff", method= RequestMethod.GET)
	public ModelAndView dayOff(@RequestParam String cafe_id) throws Exception{
		ModelAndView mv = new ModelAndView();
		mpcafeVo vo = new mpcafeVo();
		vo = service.dayoffSelect(cafe_id);
		mv.addObject("vo", vo);	
		
		mv.setViewName("mypage_cafe/dayOff");			
		return mv;
	}
	
	@RequestMapping(value = "/deleteOff", method = RequestMethod.GET)
	public ModelAndView deleteOff(@RequestParam(value="off_id") String off_id, @RequestParam(value="cafe_id") String cafe_id) throws Exception {
		b = service.deleteOff(off_id);
		ModelAndView mv = new ModelAndView();
		mpcafeVo vo = new mpcafeVo();
		vo = service.dayoffSelect(cafe_id);
		mv.addObject("vo", vo); //다시 vo값을 넣어서 리다이렉트
		mv.setViewName("mypage_cafe/dayOff");
		return mv;
	}
	
	@RequestMapping(value = "/deleteMenu", method = RequestMethod.GET)
	public ModelAndView deletMenu(@RequestParam(value="menu_id") String menu_id, @RequestParam(value="cafe_id") String cafe_id) throws Exception {
		b = service.deleteMenu(menu_id);
		ModelAndView mv = new ModelAndView();
		mpcafeVo vo = new mpcafeVo();
		vo = service.view(cafe_id);
		mv.addObject("vo", vo); //다시 vo값을 넣어서 리다이렉트
		mv.setViewName("mypage_cafe/cafeupdate");
		return mv;
	}
	
	
	@RequestMapping(value="dayOffSave", method= RequestMethod.POST)
	public ModelAndView dayOffSave(String start_time, String end_time, dayoffVo dvo, HttpServletResponse resp) {
		ModelAndView mv = new ModelAndView();
		
		if(dvo.getStart_time().equals("") && dvo.getEnd_time().equals("")) {			
			dvo.setOff_type("휴무");		
			b = service.insertOffday(dvo);
		}else {
			dvo.setOff_type("일시정지");		
			b = service.insertOff(dvo);
		}
		String msg = "";
		if(b) {
			msg="영업일 관리가 성공적으로 완료되었습니다.";
		}else {
			msg="영업일 관리중 오류가 발생했습니다. 다시 시도해주세요";
		}
		mv.addObject("vo", vo);
		mv.addObject("msg", msg);
		mv.setViewName("mypage_cafe/dayoff_result");
		return mv;

	}
	
	@RequestMapping(value="menuSave", method=RequestMethod.POST)
	public ModelAndView drinkSave(String cafe_id, mpcafe_listVo lvo, HttpServletResponse resp) {
		b = service.insertMenu(lvo);
		ModelAndView mv = new ModelAndView();
		vo = service.view(cafe_id);
		mv.addObject("vo", vo);
		mv.addObject("cafe_id", cafe_id);
		mv.setViewName("mypage_cafe/cafeupdate");
		return mv;

	}
	
	@RequestMapping("fileSave")
	public ModelAndView upload(String cafe_id,
			@RequestParam("photo_name") List<MultipartFile> mul,
			@ModelAttribute mpcafeVo vo) {
		
		ModelAndView mv = new ModelAndView();
		List<mpcafe_listVo> otherphotos = new ArrayList<mpcafe_listVo>();
		
		try {
			if(mul.size()>0) {
				
				for(MultipartFile m : mul) {
					File targetFile = new File(uploadPath + m.getOriginalFilename());
					m.transferTo(targetFile);
					mpcafe_listVo lvo = new mpcafe_listVo();
					lvo.setCafe_id(cafe_id);
					lvo.setPhoto_name(m.getOriginalFilename());
					otherphotos.add(lvo);
				}
				
				vo.setOtherphotos(otherphotos);
				b = service.insertAtt(vo);
				
			}
			vo = service.view(cafe_id);
			mv.addObject("vo", vo);
			mv.setViewName("mypage_cafe/cafeupdate");
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping(value = "/deleteOtherphoto", method = RequestMethod.GET)
	public ModelAndView deletOtherphoto(@RequestParam(value="photo_name") String photo_name, @RequestParam(value="cafe_id") String cafe_id) throws Exception {
		b = service.deleteOtherphoto(photo_name);
		ModelAndView mv = new ModelAndView();
		mpcafeVo vo = new mpcafeVo();
		vo = service.view(cafe_id);
		mv.addObject("vo", vo); //다시 vo값을 넣어서 리다이렉트
		mv.setViewName("mypage_cafe/cafeupdate");
		return mv;
	}
	
	@RequestMapping(value="titlemodify", method= RequestMethod.POST)
	public ModelAndView titlemodify(@RequestParam("title_photo") MultipartFile file, @RequestParam("pre_title") String pre_title
			,@RequestParam("cafe_id") String cafe_id) throws Exception {
		
		boolean isModifyTitle = false;
		ModelAndView mv = new ModelAndView();
		
		try {
		if(file.getOriginalFilename()!= null && !file.getOriginalFilename().equals("")) {		
		//우선 폴더에 있는 기존파일을 삭제
		System.out.println("pre_title : " + pre_title);
		
		File delFile = new File(uploadPath + pre_title);
		if(delFile.exists()) delFile.delete();
		
		if(!delFile.exists()) {
			//경로에 새 파일을 추가 및 vo에 새 파일명 설정
			File targetFile = new File(uploadPath + file.getOriginalFilename());
			file.transferTo(targetFile);
			mpcafeVo vo = new mpcafeVo();
			vo.setTitle_photo(file.getOriginalFilename());
			vo.setCafe_id(cafe_id);
			System.out.println("title_photo : " + vo.getTitle_photo());
			System.out.println("cafe_id : " + cafe_id);
			//service로 보내서 db에 새 타이틀 포토 이름을 업데이트
			isModifyTitle = service.modifyTitle(vo);
			
			if(isModifyTitle) {
				//여기는 페이지를 다시 띄우기 위한부분
				vo = service.view(cafe_id);
				mv.addObject("vo", vo);
				mv.addObject("cafe_id", cafe_id);
			} 
		} 
		}mv.setViewName("/mypage_cafe/cafeupdate");

		
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return mv;
	}
	
		
}












