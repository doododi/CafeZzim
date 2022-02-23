package com.cafe.gitteam1.search;

public class ReviewVo {
	private int cid;
	private String mid;
	private int score;
	private String content;
	private String photo;
	
	@Override
	public String toString() {
		return "ReviewVo [cid=" + cid + ", mid=" + mid + ", score=" + score + ", content=" + content + ", photo="
				+ photo + "]";
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
}
