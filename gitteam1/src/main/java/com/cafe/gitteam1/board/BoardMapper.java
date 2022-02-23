package com.cafe.gitteam1.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface BoardMapper {
	
	// notice
	public int notice_totSize(String notice_search);
	public List<NoticeVo> notice_search(NoticePage p);
	public List<NoticePhotoVo> notice_show_file(String notice_serial);
	
	public int notice_insert(NoticeVo vo);
	public int last_insert_id();
	public int notice_insert_photo(NoticePhotoVo nvo);
	
	public NoticeVo notice_view(String notice_serial); 
	
	public int notice_modify(NoticeVo vo);
	public int notice_modify_file(List<String> notice_delete_files);
	
	public int notice_delete(String notice_serial);
	public List<NoticePhotoVo> notice_file_list(String notice_serial); 
	public int notice_delete_file(String notice_serial);
	
	// Q&A
	public int qa_totSize(String qa_search);
	public List<QaVo> qa_search(QaPage p);
	public List<QaPhotoVo> qa_show_file(String qa_serial);
	
	public int qa_insert(QaVo vo);
	public int qa_insert_isSecret(QaVo vo);
	public int qa_insert_grpno(QaVo vo);
	public int qa_last_insert_id();
	public int qa_insert_file(QaPhotoVo qno);
	
	public QaVo qa_view(String qa_serial);
	public String qa_search_grpno(String qa_serial);
	public QaVo qa_view_grpno(String grpno);
	
	public int qa_modify(QaVo vo);
	public int qa_modify_file(List<String> qa_delete_files);
	
	public int qa_insert_repl(QaVo vo);
	public String qa_repl_id(String qa_serial);
	public int qa_insert_repl_id(String qa_serial, String repl_id);
	
	public int qa_delete(String grpno);
	public int qa_search_repl(String grpno);
	public int qa_delete_repl_first(String grpno);
	public String qa_search_serial(String grpno);
	public int qa_delete_repl(String qa_serial);
	public int qa_delete_file(String qa_serial);
	public List<QaPhotoVo> qa_file_list(String qa_serial);
}
