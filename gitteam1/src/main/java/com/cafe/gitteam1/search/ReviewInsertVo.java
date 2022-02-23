package com.cafe.gitteam1.search;

import org.springframework.web.multipart.MultipartFile;

public class ReviewInsertVo {
	private int cafe_id;
	private String member_id;
	private int review_score;
	private String review_content;
	private MultipartFile review_photo;
	
	
	@Override
	public String toString() {
		return "ReviewInsertVo [cafe_id=" + cafe_id + ", member_id=" + member_id + ", review_score=" + review_score
				+ ", review_content=" + review_content + ", review_photo=" + review_photo + "]";
	}
	
	public int getCafe_id() {
		return cafe_id;
	}
	public void setCafe_id(int cafe_id) {
		this.cafe_id = cafe_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getReview_score() {
		return review_score;
	}
	public void setReview_score(int review_score) {
		this.review_score = review_score;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public MultipartFile getReview_photo() {
		return review_photo;
	}
	public void setReview_photo(MultipartFile review_photo) {
		this.review_photo = review_photo;
	}
}
