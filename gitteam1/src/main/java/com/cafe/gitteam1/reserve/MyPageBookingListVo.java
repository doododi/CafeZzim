package com.cafe.gitteam1.reserve;

public class MyPageBookingListVo {
	String cname;
	String caddress;
	String img;
	String rdate;
	String reserve_name;
	int reserve_id;
	int isCancelled;
	String uuid;
	int payment_price;
	String phone;
	String time;
	int seats4;
	int seats2;
	
	
	
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getSeats4() {
		return seats4;
	}
	public void setSeats4(int seats4) {
		this.seats4 = seats4;
	}
	public int getSeats2() {
		return seats2;
	}
	public void setSeats2(int seats2) {
		this.seats2 = seats2;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCaddress() {
		return caddress;
	}
	public void setCaddress(String caddress) {
		this.caddress = caddress;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getReserve_name() {
		return reserve_name;
	}
	public void setReserve_name(String reserve_name) {
		this.reserve_name = reserve_name;
	}
	public int getReserve_id() {
		return reserve_id;
	}
	public void setReserve_id(int reserve_id) {
		this.reserve_id = reserve_id;
	}
	public int getIsCancelled() {
		return isCancelled;
	}
	public void setIsCancelled(int isCancelled) {
		this.isCancelled = isCancelled;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public int getPayment_price() {
		return payment_price;
	}
	public void setPayment_price(int payment_price) {
		this.payment_price = payment_price;
	}

	
}
