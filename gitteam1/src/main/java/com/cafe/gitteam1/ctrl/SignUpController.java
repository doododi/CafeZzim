package com.cafe.gitteam1.ctrl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.cafe.gitteam1.member.MemberVo;
import com.cafe.gitteam1.signUp.AES;
import com.cafe.gitteam1.signUp.SignUpService;


@RestController
public class SignUpController {
	@Autowired
	SignUpService service;
	
	
	MemberVo vo = null;
	String msg="";
	boolean b = false;
	String findStr = "";
	AES aes = new AES();
	
	@RequestMapping("signUp")
	public ModelAndView signUp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("signUp_member/signUp");
		return mv;
	}
	//중복체크 페이지 열기
	@RequestMapping("id_check")
	public ModelAndView id_check() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("signUp_member/id_check");
		return mv;
	}
	@RequestMapping("signUpResult")
	public ModelAndView signUpResult() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("signUp_member/signUp_result");
		return mv;
	}
	//회원가입
	@RequestMapping(value="join", method= {RequestMethod.POST})
	public ModelAndView join(MemberVo vo) {
		ModelAndView mv = new ModelAndView();
		b = service.join(vo);
		if(b) {
			msg="회원가입이 완료되었습니다.";
		}else {
			msg="회원가입중 오류가 발생하였습니다.";	
		}
		mv.addObject("msg",msg);
		mv.setViewName("signUp_member/signUp_result");
		return mv;
	}
	//아이디체크 mapper 연결시
	/*
	@RequestMapping(value="/idCheck", method= {RequestMethod.POST})
	public ModelAndView idCheck(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		String checkId = req.getParameter("checkId");
		int c = service.idCheck(checkId);
		if(c>0) {
			msg="사용 불가한 아이디입니다.";
		}else {
			msg="사용 가능한 아이디입니다.";
		}
		mv.addObject("msg",msg);
		mv.setViewName("signUp_member/id_check");
		return mv;
	}
	*/
	@RequestMapping(value="idCheck", method= {RequestMethod.POST})
	public int idCheck(HttpServletRequest req) {
		String checkId = req.getParameter("checkId");
		int c = service.idCheck(checkId);		
		return c;
	}	
	@RequestMapping(value="emailCheck", method= {RequestMethod.POST})
	public int emailCheck(HttpServletRequest req) {
		String checkEmail = req.getParameter("checkEmail");
		int c = service.emailCheck(checkEmail);		
		return c;
	}
	
	@RequestMapping("mypage_member")
	public ModelAndView mypageModify(HttpServletRequest req, @SessionAttribute("member_id") String mid) {
		ModelAndView mv = new ModelAndView();
		vo = service.searchMemberView(mid);
		mv.addObject("vo",vo);
		mv.setViewName("myPage_member/mypage_member");
		return mv;
	}
	
	@RequestMapping("mypage_memberView")
	public ModelAndView mypageModifyView(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		String mid = req.getParameter("member_id");
		vo = service.searchMemberView(mid);
		mv.addObject("vo",vo);
		mv.setViewName("myPage_member/mypage_memberView");
		return mv;
	}  
	@RequestMapping("mypage_admin")
	public ModelAndView mypageAdmin(HttpServletRequest req, HttpSession session) {		
		ModelAndView mv = new ModelAndView();
		findStr = req.getParameter("findStr");
		List<MemberVo> list = service.searchMember(findStr);
		mv.addObject("list",list);	

		if(session.getAttribute("grade").equals("master")) {								
			mv.setViewName("myPage_member/mypage_admin");
			
		} else {
			mv.setViewName("redirect:/");
		}return mv;
	}
	@RequestMapping("memberModify")
	public ModelAndView memberModify(MemberVo vo) {
		ModelAndView mv = new ModelAndView();
		b = service.memberModify(vo);
		if(b) {
			msg="회원정보가 수정되었습니다.";
		}else {
			msg="회원정보 수정중 오류가 발생하였습니다.";	
		}
		mv.addObject("msg",msg);
		mv.setViewName("myPage_member/mypage_modifyResult");
		return mv;
	}
	@RequestMapping("memberDelete")
	public ModelAndView memberDelete(MemberVo vo, HttpSession session, ModelAndView mv) {
		b = service.memberCancel(vo);
		if(b) {
			msg="회원이 탈퇴되었습니다.";
		}else {
			msg="회원정보 삭제중 오류가 발생하였습니다.";	
		}
		mv.addObject("msg",msg);
		session.invalidate();
		/* mService.signOut(session); */
		mv.setViewName("redirect:/");
		return mv;
	}
	@RequestMapping("masterDelete")
	public ModelAndView masterDelete(MemberVo vo) {
		ModelAndView mv = new ModelAndView();
		b = service.memberCancel(vo);
		if(b) {
			msg="회원이 탈퇴되었습니다.";
		}else {
			msg="회원정보 삭제중 오류가 발생하였습니다.";	
		}
		mv.addObject("msg",msg);
		mv.setViewName("myPage_member/mypage_modifyResult");
		return mv;
	}
}
