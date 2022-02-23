package com.cafe.gitteam1.board;

public class QaPhotoVo {
	private int photo_serial;
	
	private String qa_file;
	
	private String qa_origin_file;
	
	private int qa_serial;

	public int getPhoto_serial() {
		return photo_serial;
	}
	public void setPhoto_serial(int photo_serial) {
		this.photo_serial = photo_serial;
	}
	public String getQa_file() {
		return qa_file;
	}
	public void setQa_file(String qa_file) {
		this.qa_file = qa_file;
	}
	public String getQa_origin_file() {
		return qa_origin_file;
	}
	public void setQa_origin_file(String qa_origin_file) {
		this.qa_origin_file = qa_origin_file;
	}
	public int getQa_serial() {
		return qa_serial;
	}
	public void setQa_serial(int qa_serial) {
		this.qa_serial = qa_serial;
	}
	
	@Override
	public String toString() {
		return "QaPhotoVo [photo_serial=" + photo_serial + ", qa_file=" + qa_file + ", qa_origin_file=" + qa_origin_file
				+ ", qa_serial=" + qa_serial + "]";
	}
	
}
