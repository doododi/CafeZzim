package com.cafe.gitteam1.ctrl;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.cafe.gitteam1.member.FindUtil;
import com.cafe.gitteam1.member.KakaoAPI;
import com.cafe.gitteam1.member.MailUtil;
import com.cafe.gitteam1.member.MemberService;
import com.cafe.gitteam1.member.MemberVo;

@RestController
public class SignInController {

	@Autowired
	MemberService service;
	
	@Autowired
	KakaoAPI kakaoApi;
	
	MemberVo vo;

	@RequestMapping("signIn")
	public ModelAndView login(HttpSession session) {
		ModelAndView mv = new ModelAndView();

		if(session.getAttribute("member_id") != null) {
			mv.setViewName("redirect:/");
		} else {
			mv.setViewName("member/signIn");
		}
		return mv;
	}
	
	@RequestMapping("signInCheck")
	public ModelAndView signInCheck(@ModelAttribute MemberVo vo, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		boolean isSignIn = service.signInCheck(vo, session);
		ModelAndView mv = new ModelAndView();

		if(isSignIn) {
			if(request.getParameter("useCookie") != null) {
				long second = 60 * 60 * 24 * 90; // 7일 뒤의 초
				
				// 쿠키 생성
				Cookie cookie = new Cookie("loginCookie", session.getId());
				cookie.setPath("/");
				cookie.setMaxAge((int)second);
				response.addCookie(cookie);
				
				// 7일 뒤의 밀리초를 날짜로 변환
				long millis = System.currentTimeMillis() + (second * 1000);
				Date limit_date = new Date(millis);
				
				// DB에 세션아이디, 쿠키만료날짜, 회원 아이디 전달
				service.autoLogin(session.getId(), limit_date, vo.getMember_id());
			}
			mv.setViewName("redirect:/");
		} else {
			mv.setViewName("member/signIn");
			mv.addObject("message", "failure");
		}
		return mv;
	}
	
	// 카카오 로그인
	@RequestMapping(value="kakaoLogin", method=RequestMethod.GET)
	public ModelAndView kakaoLogin(@RequestParam("code") String code, HttpSession session, MemberVo vo) {
		ModelAndView mv = new ModelAndView();
		// 1번 인증코드 요청 전달
		String accessToken = kakaoApi.getAccessToken(code);
		// 2번 인증코드로 토큰 전달
		MemberVo userInfo = kakaoApi.getUserInfo(accessToken);
		
		session.setAttribute("name", userInfo.getMember_name());
		session.setAttribute("member_id", userInfo.getMember_id());
		session.setAttribute("grade", "customer");
		
		mv.setViewName("redirect:/");
		return mv;
	}
	
	@RequestMapping("searchId")
	public ModelAndView searchId(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		if(session.getAttribute("member_id") != null) {
			mv.setViewName("redirect:/");
		} else {
			mv.setViewName("member/searchId");
		}
		return mv;
	}

	@RequestMapping("searchIdCheck")
	public ModelAndView searchIdCheck(@ModelAttribute MemberVo vo) {
		boolean isSearchId = service.searchId(vo);
		String member_id = service.viewId(vo);
		
		ModelAndView mv = new ModelAndView();
		if(isSearchId) {
			mv.setViewName("member/searchIdCheck");
			mv.addObject("member_id", member_id);
		} else {
			mv.setViewName("member/searchId");
			mv.addObject("message", "failure");
		}
		return mv;
	}

	@RequestMapping("searchPw")
	public ModelAndView searchPw(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("member_id") != null) {
			mv.setViewName("redirect:/");
		} else {
			mv.setViewName("member/searchPw");
		}
		return mv;
	}


	@RequestMapping(value = "searchPwCheck", method = RequestMethod.POST)
	public void searchPwCheck() throws Exception{
	}

	@RequestMapping(value="sendTempPw", method=RequestMethod.POST)
	public String searchPwCheck(MemberVo vo, String member_id, String member_email, Model model) {
		String notice = "";
		try {
			boolean isPwCheck = service.searchPw(vo);
			if(isPwCheck) {
				String newPassword = FindUtil.getNewPassword();
				boolean isChangePw = service.changePw(newPassword, member_id);

				if(isChangePw) {
					String subject = "[CafeZzim] 임시 비밀번호 발급 안내";

					String message = "";
					message += "<div align='left'>";
					message += "<h3>";
					message += vo.getMember_name() + "님의 임시 비밀번호입니다.";
					message += "<br>로그인 후 비밀번호를 변경하시기 바랍니다.</h3>";
					message += "<p>임시 비밀번호 : ";
					message += newPassword + "</p></div>"; // vo.getPassword()는 null 값이 떨어짐 -> 이유는 모름 

					MailUtil.sendMail(member_email, subject, message);
					notice = "임시 비밀번호가 발급되었습니다.";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return notice;
	}

	@RequestMapping("signOut")
	public ModelAndView signOut (HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		
		String member_id = (String) session.getAttribute("member_id");
		
		if(member_id != null) {
			session.removeAttribute("member_id");
			session.invalidate();
			Cookie cookie = WebUtils.getCookie(request, "loginCookie");
			
			// 자동로그인을 한 상태의 사용자가 로그아웃을 할 경우
			if(cookie != null) {
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				service.autoLogin("none", new Date(), member_id);
			}
			mv.setViewName("redirect:/");
		} else if(session.getAttribute("accessToken") != null) {
			kakaoApi.kakaoLogout((String)session.getAttribute("accessToken"));
			session.invalidate();
			mv.setViewName("redirect:/");
		}
		return mv;
	}
} 