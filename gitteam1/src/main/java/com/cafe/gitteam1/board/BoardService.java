package com.cafe.gitteam1.board;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.cafe.gitteam1.ctrl.BoardController;

@Service
@Transactional
public class BoardService {

	@Autowired
	BoardMapper mapper;
	
	@Autowired
	PlatformTransactionManager manager;
	
	TransactionStatus status;
	NoticePage NoticePage;
	QaPage QaPage;
	
	// notice
	public List<NoticeVo> notice_search(NoticePage p){
		List<NoticeVo> list = null;
		
		int totSize = mapper.notice_totSize(p.getNotice_search());
		p.setTotSize(totSize);
		this.NoticePage = p;
		
		list = mapper.notice_search(p);
		
		return list;
	}
	
	public NoticeVo notice_view(String notice_serial) {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		NoticeVo vo = null;
		List<NoticePhotoVo> notice_file_list = null;
		
		try {
			vo = mapper.notice_view(notice_serial);
			notice_file_list = mapper.notice_show_file(notice_serial);
			vo.setNotice_files(notice_file_list);
			
			manager.commit(status);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public boolean notice_insert(NoticeVo vo) {
		boolean isInsert = false;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		int c = mapper.notice_insert(vo);
		
		if(c > 0) {
			manager.commit(status);
			isInsert = true;
			
		} else {
			manager.rollback(status);
		}
		return isInsert;
	}
	
	public int notice_last_insert_id() {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		int last_id = mapper.last_insert_id();
		
		if(last_id > 0) {
			manager.commit(status);
		}
		return last_id;
	}
	
	public boolean notice_insert_photo(NoticeVo vo) {
		boolean isInsertPhoto = false;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		int c = 0;
		
		try {
			// 배열로 저장된 내용이 DB에 저장된다.
			for(NoticePhotoVo nvo : vo.getNotice_files()) {
				c += mapper.notice_insert_photo(nvo);
			}
			
			if(c == vo.getNotice_files().size()) {
				manager.commit(status);
				isInsertPhoto = true;
			} else {
				manager.rollback(status);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isInsertPhoto;
	}
	
	public boolean notice_modify(NoticeVo vo) {
		boolean isModify = false;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		int c = mapper.notice_modify(vo);
		
		if(c > 0) {
			manager.commit(status);
			isModify = true;
		} else {
			manager.rollback(status);
		}
		return isModify;
	}
	
	public boolean notice_modify_file(NoticeVo vo) {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		boolean isDeleteFile = false;
		if(vo.getNotice_delete_files().size() > 0) {
			mapper.notice_modify_file(vo.getNotice_delete_files());
		
			manager.commit(status);
			isDeleteFile = true;
			
			for(String file : vo.getNotice_delete_files()) {
				File delete_file = new File(BoardController.uploadPath_notice + file);
				if(delete_file.exists()) delete_file.delete();
			}
		} else {
			manager.rollback(status);
		}
		
		return isDeleteFile;
	}
	
	public boolean notice_delete(String notice_serial) {
		boolean isDelete = false;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		int c = mapper.notice_delete(notice_serial);
		
		if(c > 0) {
			manager.commit(status);
			isDelete = true;
		} else {
			manager.rollback(status);
		}
		return isDelete;
	}
	
	public boolean notice_delete_file(String notice_serial) {
		boolean isDeleteFile = false;
		NoticeVo vo = new NoticeVo();
		List<NoticePhotoVo> notice_file_list = mapper.notice_file_list(notice_serial);
		vo.setNotice_files(notice_file_list);
		
		int c = mapper.notice_delete_file(notice_serial);
		
		if(c > 0) {
			isDeleteFile = true;
			for(NoticePhotoVo nvo : vo.getNotice_files()) {
				File delete_file = new File(BoardController.uploadPath_notice + nvo.getNotice_file());
				if(delete_file.exists()) delete_file.delete();
			}
		}
		return isDeleteFile;
	}
	
	// Q&A
	public List<QaVo> qa_search(QaPage p){
		List<QaVo> list = null;
		
		int totSize = mapper.qa_totSize(p.getQa_search());
		p.setTotSize(totSize);
		this.QaPage = p;
		
		list = mapper.qa_search(p);
		
		return list;
	}
	
	public QaVo qa_view(String qa_serial) {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		QaVo vo = null;
		List<QaPhotoVo> qa_file_list = null;
		
		try {
			vo = mapper.qa_view(qa_serial);
			qa_file_list = mapper.qa_show_file(qa_serial);
			vo.setQa_files(qa_file_list);
			
			manager.commit(status);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public String qa_search_grpno(String qa_serial) {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		String grpno = "";
		
		try {
			grpno = mapper.qa_search_grpno(qa_serial);
			manager.commit(status);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return grpno;
	}
	
	public QaVo qa_view_grpno(String grpno) {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		QaVo vo = null;
		
		try {
			vo = mapper.qa_view_grpno(grpno);
					manager.commit(status);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public boolean qa_insert(QaVo vo) {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		boolean isInsert = false;
		int c = mapper.qa_insert(vo);

		if(c > 0) {
			manager.commit(status);
			isInsert = true;
		} else {
			manager.rollback(status);
		}
		return isInsert;
	}
	
	public void qa_insert_isSecret(QaVo vo) {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		int c = mapper.qa_insert_isSecret(vo);

		if(c > 0) {
			manager.commit(status);
		} else {
			manager.rollback(status);
		}
	}
	
	public boolean qa_insert_grpno(QaVo vo) {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		boolean isInsertGrpno = false;
		int c = mapper.qa_insert_grpno(vo);
		
		if(c > 0) {
			manager.commit(status);
			isInsertGrpno = true;
		} else {
			manager.rollback(status);
		}
		return isInsertGrpno;
	}
	
	public int qa_last_insert_id() {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		int last_id = mapper.qa_last_insert_id();
		
		if(last_id > 0) {
			manager.commit(status);
		}
		return last_id;
	}
	
	public boolean qa_insert_file(QaVo vo) {
		boolean isInsertFile = false;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		int c = 0;
		
		try {
			// 배열로 저장된 내용이 DB에 저장된다.
			for(QaPhotoVo qvo : vo.getQa_files()) {
				c += mapper.qa_insert_file(qvo);
			}
			
			if(c == vo.getQa_files().size()) {
				manager.commit(status);
				isInsertFile = true;
			} else {
				manager.rollback(status);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isInsertFile;
	}
	
	public boolean qa_modify(QaVo vo) {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		boolean isModify = false;
		int c = mapper.qa_modify(vo);
		
		if(c > 0) {
			manager.commit(status);
			isModify = true;
		} else {
			manager.rollback(status);
		}
		return isModify;
	}
	
	public boolean qa_modify_file(QaVo vo) {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		boolean isDeleteFile = false;
		if(vo.getQa_delete_files().size() > 0) {
			mapper.qa_modify_file(vo.getQa_delete_files());
		
			manager.commit(status);
			isDeleteFile = true;
			
			for(String file : vo.getQa_delete_files()) {
				File delete_file = new File(BoardController.uploadPath_qa + file);
				if(delete_file.exists()) delete_file.delete();
			}
		} else {
			manager.rollback(status);
		}
		
		return isDeleteFile;
	}
	
	public boolean qa_insert_repl(QaVo vo) {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		boolean isReplInsert = false;
		int c = mapper.qa_insert_repl(vo);
		
		if(c > 0) {
			manager.commit(status);
			isReplInsert = true;
		} else {
			manager.rollback(status);
		}
		return isReplInsert;
	}
	
	public String qa_repl_id (String qa_serial) {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		String repl_id = "";
		
		try {
			repl_id = mapper.qa_repl_id(qa_serial);
			manager.commit(status);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return repl_id;
	}
	
	public boolean qa_insert_repl_id (String qa_serial, String repl_id) {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		boolean isRepl_idInsert = false;
		int c = mapper.qa_insert_repl_id(qa_serial, repl_id);
		
		try {
			if(c > 0) {
				isRepl_idInsert = true;
				manager.commit(status);
			} else {
				manager.rollback(status);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isRepl_idInsert;
	}
	
	public boolean qa_delete(String grpno) {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		boolean isDelete = false;
		int c = mapper.qa_delete(grpno);
		
		if(c > 0) {
			manager.commit(status);
			isDelete = true;
		} else {
			manager.rollback(status);
		}
		return isDelete;
	}
	
	public boolean qa_search_repl(String grpno) {
		boolean isSearchRepl = false;
		int c = mapper.qa_search_repl(grpno);
		
		if(c > 1) {
			isSearchRepl = true;
		}
		return isSearchRepl;
	}
	
	public String qa_search_serial(String grpno) {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		String qa_serial = mapper.qa_search_serial(grpno);
		manager.commit(status);
		return qa_serial;
	}
	
	public boolean qa_delete_repl(String qa_serial) {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		boolean isDeleteRepl = false;
		int c = mapper.qa_delete_repl(qa_serial);
		
		if(c > 0) {
			manager.commit(status);
			isDeleteRepl = true;
		} else {
			manager.rollback(status);
		}
		return isDeleteRepl;
	}
	
	public boolean qa_delete_file(String qa_serial) {
		boolean isDeleteFile = false;
		QaVo vo = new QaVo();
		List<QaPhotoVo> qa_file_list = mapper.qa_file_list(qa_serial);
		vo.setQa_files(qa_file_list);
		
		int c = mapper.qa_delete_file(qa_serial);
		
		if(c > 0) {
			isDeleteFile = true;
			for(QaPhotoVo qvo : vo.getQa_files()) {
				File delete_file = new File(BoardController.uploadPath_qa + qvo.getQa_file());
				if(delete_file.exists()) delete_file.delete();
			}
		}
		return isDeleteFile;
	}
	
	public NoticePage getNoticePage() {
		return NoticePage;
	}
	public void setNoticePage(NoticePage page) {
		NoticePage = page;
	}

	public QaPage getQaPage() {
		return QaPage;
	}
	public void setQaPage(QaPage qaPage) {
		QaPage = qaPage;
	}
	
}
