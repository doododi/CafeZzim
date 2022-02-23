package com.cafe.gitteam1.reserve;

public class CancelVo {
	String id;
	String member_grade;
	String nowDate;
	String mid;
	String mgrade;
	String uuid;
	int Payment;
	
	// 게터 세터 
	public String getNowDate() {
		return nowDate;
	}
	public void setNowDate(String nowDate) {
		this.nowDate = nowDate;
	}
	public String getmId() {
		return mid;
	}
	public void setmId(String mId) {
		this.mid = mId;
	}

	public String getMgrade() {
		return mgrade;
	}
	public void setMgrade(String mgrade) {
		this.mgrade = mgrade;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMember_grade() {
		return member_grade;
	}
	public void setMember_grade(String member_grade) {
		this.member_grade = member_grade;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getPayment() {
		return Payment;
	}
	public void setPayment(int payment) {
		Payment = payment;
	}
}
