package com.cafe.gitteam1.member;

import java.sql.Date;

public class MemberVo {
	private String member_id;

	private String member_name;

	private String password;

	private String member_phone;

	private String member_email;

	private String member_grade;
	
	private Date join_date;
	
	private boolean isSocial;
	
	private boolean autoLogin;
	
	private String session_id;
	
	private Date limit_date;
	
	private String cafe_id;
	

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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_grade() {
		return member_grade;
	}
	public void setMember_grade(String member_grade) {
		this.member_grade = member_grade;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public boolean isSocial() {
		return isSocial;
	}
	public void setSocial(boolean isSocial) {
		this.isSocial = isSocial;
	}
	public boolean isAutoLogin() {
		return autoLogin;
	}
	public void setAutoLogin(boolean autoLogin) {
		this.autoLogin = autoLogin;
	}
	public String getSession_id() {
		return session_id;
	}
	public void setSession_id(String session_id) {
		this.session_id = session_id;
	}
	public Date getLimit_date() {
		return limit_date;
	}
	public void setLimit_date(Date limit_date) {
		this.limit_date = limit_date;
	}
	
	@Override
	public String toString() {
		return "MemberVo [member_id=" + member_id + ", member_name=" + member_name + ", password=" + password
				+ ", member_phone=" + member_phone + ", member_email=" + member_email + ", member_grade=" + member_grade
				+ ", join_date=" + join_date + ", isSocial=" + isSocial + ", autoLogin=" + autoLogin + ", session_id="
				+ session_id + ", limit_date=" + limit_date + "]";
	}
	public String getCafe_id() {
		return cafe_id;
	}
	public void setCafe_id(String cafe_id) {
		this.cafe_id = cafe_id;
	}
	
}