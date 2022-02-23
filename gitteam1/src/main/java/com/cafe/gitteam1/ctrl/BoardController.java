package com.cafe.gitteam1.ctrl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cafe.gitteam1.board.BoardService;
import com.cafe.gitteam1.board.NoticePhotoVo;
import com.cafe.gitteam1.board.NoticeVo;
import com.cafe.gitteam1.board.QaPage;
import com.cafe.gitteam1.board.QaPhotoVo;
import com.cafe.gitteam1.board.QaVo;
import com.cafe.gitteam1.board.NoticePage;

@RestController
public class BoardController {
	
	public static String uploadPath_notice = "/home/hosting_users/gitteam1/tomcat/webapps/upload/notice/";
	public static String uploadPath_qa = "/home/hosting_users/gitteam1/tomcat/webapps/upload/qa/";
//	public static String uploadPath_notice = "/Users/idohyeong/Desktop/Cafezzim-master 2/src/main/webapp/upload/notice/";
//	public static String uploadPath_qa = "/Users/idohyeong/Desktop/Cafezzim-master 2/src/main/webapp/upload/qa/";
	
	@Autowired
	BoardService service;
	
	UUID uuid = null;
	
	/* 공지사항 ---------------------------------------------------*/
	@RequestMapping(value="notice", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView notice(NoticePage page) {
		ModelAndView mv = new ModelAndView();
		List<NoticeVo> list = service.notice_search(page);
		page = service.getNoticePage();

		mv.addObject("page", page);
		mv.addObject("list", list);
		mv.setViewName("board_notice/notice_list");
		return mv;
	}
	
	@RequestMapping("notice_view")
	public ModelAndView notice_view(String notice_serial, NoticePage page) {
		ModelAndView mv = new ModelAndView();
		NoticeVo vo = service.notice_view(notice_serial);
		
		mv.addObject("vo", vo);
		mv.addObject("page", page);
		mv.setViewName("board_notice/notice_view");
		return mv;
	}
	
	@RequestMapping("notice_insert")
	public ModelAndView notice_insert(NoticePage page, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("page", page);
		
		if(session.getAttribute("grade") != null && session.getAttribute("grade").equals("master")) {
			mv.setViewName("board_notice/notice_insert");
		} else {
			mv.setViewName("redirect:notice");
		}

		return mv;
	}
	
	// 첨부 파일까지 포함 
	@RequestMapping(value="notice_insert_check")
	public ModelAndView notice_insert_check(@ModelAttribute NoticeVo vo, @RequestParam("file") List<MultipartFile> file) {
		ModelAndView mv = new ModelAndView();
		boolean isInsertFile = false;
		boolean isInsert = service.notice_insert(vo);
		List<NoticePhotoVo> notice_insert_file = new ArrayList<NoticePhotoVo>();
		
		try {
			if(isInsert) {
				// 첨부 파일 multiple
				for(MultipartFile m : file) {
					if(m.getOriginalFilename().equals("")) continue;
				
					// uuid로 이름 변경
					File targetFile = new File(uploadPath_notice + m.getOriginalFilename());
					m.transferTo(targetFile);
					uuid = UUID.randomUUID();
					String temp = uuid.toString() + "-" + m.getOriginalFilename();
					File rename = new File(uploadPath_notice + temp);
					targetFile.renameTo(rename);
					NoticePhotoVo nvo = new NoticePhotoVo();
					
					nvo.setNotice_origin_file(m.getOriginalFilename());
					nvo.setNotice_file(temp);
					int notice_serial = nvo.getNotice_serial();
					
					// auto_increment된 notice_serial 가져오기
					if(notice_serial == 0) {
						notice_serial = service.notice_last_insert_id();
						nvo.setNotice_serial(notice_serial);
						notice_insert_file.add(nvo);
					} else {
						notice_insert_file.add(nvo);
					}
				}

				vo.setNotice_files(notice_insert_file);
				
				isInsertFile = service.notice_insert_photo(vo);
				
				if(isInsertFile) {
					mv.setViewName("redirect:/notice");
				} else {
					mv.setViewName("redirect:/notice_insert");
				}
					
			} else {
				mv.setViewName("redirect:/notice_insert");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping("notice_modify")
	public ModelAndView notice_modify(String notice_serial, NoticePage page, NoticeVo vo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		vo = service.notice_view(notice_serial);
		
		mv.addObject("vo", vo);
		mv.addObject("page", page);
		
		if(session.getAttribute("grade") != null && session.getAttribute("grade").equals("master")) {
			mv.setViewName("board_notice/notice_modify");
		} else {
			mv.setViewName("redirect:notice");
		}
		return mv;
	}
	
	@RequestMapping(value="notice_modify_check", method= {RequestMethod.POST})
	public ModelAndView notice_modify_check(@ModelAttribute NoticeVo vo, @RequestParam("file") List<MultipartFile> file, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		boolean isInsertFile = false;
		boolean isModify = service.notice_modify(vo);
		List<NoticePhotoVo> notice_insert_file = new ArrayList<NoticePhotoVo>();
		
		try {
			if(isModify){
				for(MultipartFile m : file) {
					if(m.getOriginalFilename().equals("")) continue;
					
					File targetFile = new File(uploadPath_notice + m.getOriginalFilename());
					m.transferTo(targetFile);
					uuid = UUID.randomUUID();
					String temp = uuid.toString() + "-" + m.getOriginalFilename();
					File rename = new File(uploadPath_notice + temp);
					targetFile.renameTo(rename);
					NoticePhotoVo nvo = new NoticePhotoVo();
					
					nvo.setNotice_origin_file(m.getOriginalFilename());
					nvo.setNotice_file(temp);
					nvo.setNotice_serial(vo.getNotice_serial());

					notice_insert_file.add(nvo);
				}
				
				vo.setNotice_files(notice_insert_file);
				
				isInsertFile = service.notice_insert_photo(vo);
				
				if(isInsertFile) {
					mv.setViewName("redirect:/notice");
				} else {
					mv.setViewName("notice_modify");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping("notice_modify_file")
	public void notice_modify_file(NoticeVo vo, @RequestParam("checkBoxArr") List<String> delete_file) {
		vo.setNotice_delete_files(delete_file);
		service.notice_modify_file(vo);
	}
	
	@RequestMapping("notice_delete")
	public ModelAndView notice_delete(String notice_serial, String notice_file, NoticeVo vo) {
		ModelAndView mv = new ModelAndView();
		boolean isDelete = false;

		try {
			service.notice_delete_file(notice_serial);

			isDelete = service.notice_delete(notice_serial);
			
			if(isDelete) {
				mv.setViewName("redirect:/notice");
			} else {
				mv.setViewName("redirect:/notice_view");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/* 문의게시판(Q&A) ---------------------------------------------------*/
	@RequestMapping(value="qa", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView qa(QaPage page) {
		ModelAndView mv = new ModelAndView();
		List<QaVo> list  = service.qa_search(page);
		page = service.getQaPage();
		
		mv.addObject("page", page);
		mv.addObject("list", list);
		mv.setViewName("board_qa/qa_list");
		return mv;
	}
	
	@RequestMapping("qa_view")
	public ModelAndView qa_view(String qa_serial, String grpno, QaPage page, QaVo vo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		grpno = service.qa_search_grpno(qa_serial);
		QaVo no = service.qa_view_grpno(grpno);
		vo = service.qa_view(qa_serial);
		
		mv.addObject("vo", vo);
		mv.addObject("no", no);
		mv.addObject("page", page);
		
		if(vo.isSecret() == true) {
			if(session.getAttribute("member_id").equals(vo.getRepl_id())
			|| session.getAttribute("name").equals(vo.getMember_name())
			|| session.getAttribute("grade").equals("master")) {
				mv.setViewName("board_qa/qa_view");
			}
			
			if(session.getAttribute("name") == null) {
				mv.setViewName("redirect:/qa");
			}
		} else if(vo.isSecret() == false) {
			mv.setViewName("board_qa/qa_view");
		}
		return mv;
	}
	
	@RequestMapping("qa_insert")
	public ModelAndView qa_insert() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board_qa/qa_insert");
		return mv;
	}
	
	@RequestMapping("qa_insert_check")
	public ModelAndView qa_insert_check(@ModelAttribute QaVo vo, String isSecret, @RequestParam("file") List<MultipartFile> file) {
		ModelAndView mv = new ModelAndView();
		boolean isInsertFile = false;
		boolean isInsert = service.qa_insert(vo);
		boolean isInsertGrpno = service.qa_insert_grpno(vo);
		List<QaPhotoVo> qa_insert_file = new ArrayList<QaPhotoVo>();
		
		if(isSecret.equals("true")) {
			vo.setSecret(true);
			service.qa_insert_isSecret(vo);
		}
		
		try {
			if(isInsert) {
				if(isInsertGrpno) {
					for(MultipartFile m : file) {
						if(m.getOriginalFilename().equals("")) continue;
						File targetFile = new File(uploadPath_qa + m.getOriginalFilename());
						m.transferTo(targetFile);
						uuid = UUID.randomUUID();
						String temp = uuid.toString() + "-" + m.getOriginalFilename();
						File rename = new File(uploadPath_qa + temp);
						targetFile.renameTo(rename);
						QaPhotoVo qvo = new QaPhotoVo();
						
						qvo.setQa_origin_file(m.getOriginalFilename());
						qvo.setQa_file(temp);
						int qa_serial = qvo.getQa_serial();
						
						// auto_increment된 qa_serial 가져오기
						if(qa_serial == 0) {
							qa_serial = service.qa_last_insert_id();
							qvo.setQa_serial(qa_serial);
							qa_insert_file.add(qvo);
						} else {
							qa_insert_file.add(qvo);
						}
					}
					
					vo.setQa_files(qa_insert_file);
					
					isInsertFile = service.qa_insert_file(vo);
					
					if(isInsertFile) {
						mv.setViewName("redirect:/qa");
					} else {
						mv.setViewName("board_qa/qa_insert");
					}
				} else {
					mv.setViewName("board_qa/qa_insert");
				}
			} else {
				mv.setViewName("board_qa/qa_insert");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping("qa_modify")
	public ModelAndView qa_modify(String qa_serial, QaPage page, QaVo vo) {
		ModelAndView mv = new ModelAndView();
		vo = service.qa_view(qa_serial);
		
		mv.addObject("page", page);
		mv.addObject("vo", vo);
		mv.setViewName("board_qa/qa_modify");
		return mv;
	}
	
	@RequestMapping("qa_modify_check")
	public ModelAndView qa_modify_check(@ModelAttribute QaVo vo, @RequestParam("file") List<MultipartFile> file, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		boolean isInsertFile = false;
		boolean isModify = service.qa_modify(vo);
		List<QaPhotoVo> qa_insert_file = new ArrayList<QaPhotoVo>();
		
		try {
			if(isModify) {
				for(MultipartFile m : file) {
					if(m.getOriginalFilename().equals("")) continue;
					
					File targetFile = new File(uploadPath_qa + m.getOriginalFilename());
					m.transferTo(targetFile);
					uuid = UUID.randomUUID();
					String temp = uuid.toString() + "-" + m.getOriginalFilename();
					File rename = new File(uploadPath_qa + temp);
					targetFile.renameTo(rename);
					QaPhotoVo qvo = new QaPhotoVo();
					
					qvo.setQa_origin_file(m.getOriginalFilename());
					qvo.setQa_file(temp);
					qvo.setQa_serial(vo.getQa_serial());
					
					qa_insert_file.add(qvo);
				}
				
				vo.setQa_files(qa_insert_file);
				
				isInsertFile = service.qa_insert_file(vo);
				
				if(isInsertFile) {
					mv.setViewName("redirect:/qa");
				} else {
					mv.setViewName("board_qa/qa_modify");
				}
			} else {
				mv.setViewName("board_qa/qa_modify");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping("qa_modify_file")
	public void qa_modify_file(QaVo vo, @RequestParam("checkBoxArr") List<String> delete_file) {
		vo.setQa_delete_files(delete_file);
		service.qa_modify_file(vo);
	}
	
	@RequestMapping("qa_repl")
	public ModelAndView qa_repl(String qa_serial, QaPage page, QaVo vo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		vo = service.qa_view(qa_serial);
		String repl_id = service.qa_repl_id(qa_serial);
		
		mv.addObject("vo", vo);
		mv.addObject("page", page);
		mv.addObject("repl_id", repl_id);
		
		if(session.getAttribute("grade") != null && session.getAttribute("grade").equals("master")) {
			mv.setViewName("board_qa/qa_repl");
		} else {
			mv.setViewName("redirect:/qa");
		}
		return mv;
	}
	
	@RequestMapping("qa_repl_save")
	public ModelAndView qa_repl_save(@ModelAttribute QaVo vo, String qa_serial, QaPage page, String isSecret, String repl_id, @RequestParam("file") List<MultipartFile> file) {
		ModelAndView mv = new ModelAndView();
		boolean isReplInsertFile = false;
		boolean isReplInsert = service.qa_insert_repl(vo);
		boolean isRepl_idInsert = service.qa_insert_repl_id(qa_serial, repl_id);
		List<QaPhotoVo> qa_repl_insert_file = new ArrayList<QaPhotoVo>();
		
		if(isSecret.equals("true")) {
			vo.setSecret(true);
			service.qa_insert_isSecret(vo);
		}
		
		try {
			if(isReplInsert) {
				if(isRepl_idInsert) {
					for(MultipartFile m : file) {
						if(m.getOriginalFilename().equals("")) continue;
						File targetFile = new File(uploadPath_qa + m.getOriginalFilename());
						m.transferTo(targetFile);
						uuid = UUID.randomUUID();
						String temp = uuid.toString() + "-" + m.getOriginalFilename();
						File rename = new File(uploadPath_qa + temp);
						targetFile.renameTo(rename);
						QaPhotoVo qvo = new QaPhotoVo();
						
						qvo.setQa_origin_file(m.getOriginalFilename());
						qvo.setQa_file(temp);
						int qa_repl_serial = qvo.getQa_serial();
						
						if(qa_repl_serial == 0) {
							qa_repl_serial = service.qa_last_insert_id();
							qvo.setQa_serial(qa_repl_serial);
							qa_repl_insert_file.add(qvo);
						} else {
							qa_repl_insert_file.add(qvo);
						}
					}
					
					vo.setQa_files(qa_repl_insert_file);
					
					isReplInsertFile = service.qa_insert_file(vo);
					
					if(isReplInsertFile) {
						mv.setViewName("redirect:/qa");
					} else {
						mv.setViewName("board_qa/qa_repl");
					}
				} else {
					mv.setViewName("board_qa/qa_repl");
				}
			} else {
				mv.setViewName("board_qa/qa_repl");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@RequestMapping("qa_delete")
	public ModelAndView qa_delete(String qa_serial, String grpno) {
		ModelAndView mv = new ModelAndView();
		grpno = service.qa_search_grpno(qa_serial);
		boolean isSearchRepl = service.qa_search_repl(grpno);
		boolean isDelete = false;
		
		try {
			if(isSearchRepl) {
				qa_serial = service.qa_search_serial(grpno);
				service.qa_delete_file(qa_serial);
				service.qa_delete_repl(qa_serial);
			}
			
			qa_serial = grpno;
			service.qa_delete_file(qa_serial);
			System.out.println("c : " + service.qa_delete_file(qa_serial));
			isDelete = service.qa_delete(grpno);
			
			if(isDelete) {
				mv.setViewName("redirect:/qa");
			} else {
				mv.setViewName("board_qa/qa_view");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping("qa_delete_repl")
	public ModelAndView qa_delete_repl(String qa_serial){
		ModelAndView mv = new ModelAndView();
		boolean isDeleteRepl = false;
		
		try {
			service.qa_delete_file(qa_serial);
			
			isDeleteRepl = service.qa_delete_repl(qa_serial);
			
			if(isDeleteRepl) {
				mv.setViewName("redirect:/qa");
			} else {
				mv.setViewName("board_qa/qa_view");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
}
