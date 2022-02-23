package com.cafe.gitteam1.board;

import java.util.ArrayList;
import java.util.List;

public class QaVo {
	private int qa_serial;
	
	private String member_id;
	
	private String member_name;
	
	private String subject;
	
	private String content;
	
	private String created_date;
	
	private boolean isSecret;
	
	private int grpno;
	
	private int depth;
	
	private String repl_id;
	
	// 첨부파일
	private List<QaPhotoVo> qa_files = new ArrayList<QaPhotoVo>();
	
	private List<String> qa_delete_files = new ArrayList<String>();
	
	private int file_cnt;
	
	public int getQa_serial() {
		return qa_serial;
	}
	public void setQa_serial(int qa_serial) {
		this.qa_serial = qa_serial;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreated_date() {
		return created_date;
	}
	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}
	public boolean isSecret() {
		return isSecret;
	}
	public void setSecret(boolean isSecret) {
		this.isSecret = isSecret;
	}
	public int getGrpno() {
		return grpno;
	}
	public void setGrpno(int grpno) {
		this.grpno = grpno;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public String getRepl_id() {
		return repl_id;
	}
	public void setRepl_id(String repl_id) {
		this.repl_id = repl_id;
	}
	public List<QaPhotoVo> getQa_files() {
		return qa_files;
	}
	public void setQa_files(List<QaPhotoVo> qa_files) {
		this.qa_files = qa_files;
	}
	public List<String> getQa_delete_files() {
		return qa_delete_files;
	}
	public void setQa_delete_files(List<String> qa_delete_files) {
		this.qa_delete_files = qa_delete_files;
	}
	
	public int getFile_cnt() {
		return file_cnt;
	}
	public void setFile_cnt(int file_cnt) {
		this.file_cnt = file_cnt;
	}
	
	@Override
	public String toString() {
		return "QaVo [qa_serial=" + qa_serial + ", member_id=" + member_id + ", member_name=" + member_name
				+ ", subject=" + subject + ", content=" + content + ", created_date=" + created_date + ", isSecret="
				+ isSecret + ", grpno=" + grpno + ", depth=" + depth + ", repl_id=" + repl_id + ", qa_files=" + qa_files
				+ ", qa_delete_files=" + qa_delete_files + ", file_cnt=" + file_cnt + "]";
	}
}
