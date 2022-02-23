package com.cafe.gitteam1.reserve;

public class CuponVo {
	String member_id;
	String cupon_name;
	String effect;
	int cuponSN;
	int discount;
	int discountMax;
	int used;
	int orderMin;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getCupon_name() {
		return cupon_name;
	}
	public void setCupon_name(String cupon_name) {
		this.cupon_name = cupon_name;
	}
	public String getEffect() {
		return effect;
	}
	public void setEffect(String effect) {
		this.effect = effect;
	}
	public int getCuponSN() {
		return cuponSN;
	}
	public void setCuponSN(int cuponSN) {
		this.cuponSN = cuponSN;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getDiscountMax() {
		return discountMax;
	}
	public void setDiscountMax(int max) {
		this.discountMax = max;
	}
	public int getUsed() {
		return used;
	}
	public void setUsed(int used) {
		this.used = used;
	}
	public int getOrderMin() {
		return orderMin;
	}
	public void setOrderMin(int orderMin) {
		this.orderMin = orderMin;
	}
}
