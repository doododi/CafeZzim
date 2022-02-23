package com.cafe.gitteam1.reserve;

public class ReserveVo {
int reseve_id;// auto_increament
int cafe_id;
String member_id;
String isCancelled;
String reserve_date;
String reserve_time;
String reserve_name;
String reserve_phone;
int reserve_4seats;
int reserve_2seats;
String request;
// 결제정보
int payment_price;
String payment_method;
String payment_date;
String uuid;
int cuponSN;//사용 쿠폰SN

// 발급할 쿠폰 수 
int orderCnt;

//2022-01-23추가
String cafe_name;
int sales;
String pdate;
public String getCafe_name() {
	return cafe_name;
}
public void setCafe_name(String cafe_name) {
	this.cafe_name = cafe_name;
}
public int getSales() {
	return sales;
}
public void setSales(int sales) {
	this.sales = sales;
}
public String getPdate() {
	return pdate;
}
public void setPdate(String pdate) {
	this.pdate = pdate;
}

// 게터 세터 
public int getReseve_id() {
	return reseve_id;
}
public void setReseve_id(int reseve_id) {
	this.reseve_id = reseve_id;
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
public String getIsCancelled() {
	return isCancelled;
}
public void setIsCancelled(String isCancelled) {
	this.isCancelled = isCancelled;
}
public String getReserve_date() {
	return reserve_date;
}
public void setReserve_date(String reserve_date) {
	this.reserve_date = reserve_date;
}
public String getReserve_time() {
	return reserve_time;
}
public void setReserve_time(String reserve_time) {
	this.reserve_time = reserve_time;
}
public String getReserve_name() {
	return reserve_name;
}
public void setReserve_name(String reserve_name) {
	this.reserve_name = reserve_name;
}
public String getReserve_phone() {
	return reserve_phone;
}
public void setReserve_phone(String reserve_phone) {
	this.reserve_phone = reserve_phone;
}
public int getReserve_4seats() {
	return reserve_4seats;
}
public void setReserve_4seats(int reserve_4seats) {
	this.reserve_4seats = reserve_4seats;
}
public int getReserve_2seats() {
	return reserve_2seats;
}
public void setReserve_2seats(int reserve_2seats) {
	this.reserve_2seats = reserve_2seats;
}
public String getRequest() {
	return request;
}
public void setRequest(String request) {
	this.request = request;
}
public int getPayment_price() {
	return payment_price;
}
public void setPayment_price(int payment_price) {
	this.payment_price = payment_price;
}
public String getPayment_method() {
	return payment_method;
}
public void setPayment_method(String payment_method) {
	this.payment_method = payment_method;
}
public String getPayment_date() {
	return payment_date;
}
public void setPayment_date(String payment_date) {
	this.payment_date = payment_date;
}
public String getUuid() {
	return uuid;
}
public void setUuid(String uuid) {
	this.uuid = uuid;
}
public int getCuponSN() {
	return cuponSN;
}
public void setCuponSN(int cuponSN) {
	this.cuponSN = cuponSN;
}
public int getOrderCnt() {
	return orderCnt;
}
public void setOrderCnt(int orderCnt) {
	this.orderCnt = orderCnt;
}
@Override
public String toString() {
	StringBuilder builder = new StringBuilder();
	builder.append("ReserveVo [reseve_id=");
	builder.append(reseve_id);
	builder.append(", cafe_id=");
	builder.append(cafe_id);
	builder.append(", member_id=");
	builder.append(member_id);
	builder.append(", isCancelled=");
	builder.append(isCancelled);
	builder.append(", reserve_date=");
	builder.append(reserve_date);
	builder.append(", reserve_time=");
	builder.append(reserve_time);
	builder.append(", reserve_name=");
	builder.append(reserve_name);
	builder.append(", reserve_phone=");
	builder.append(reserve_phone);
	builder.append(", reserve_4seats=");
	builder.append(reserve_4seats);
	builder.append(", reserve_2seats=");
	builder.append(reserve_2seats);
	builder.append(", request=");
	builder.append(request);
	builder.append(", payment_price=");
	builder.append(payment_price);
	builder.append(", payment_method=");
	builder.append(payment_method);
	builder.append(", payment_date=");
	builder.append(payment_date);
	builder.append(", uuid=");
	builder.append(uuid);
	builder.append(", cuponSN=");
	builder.append(cuponSN);
	builder.append(", orderCnt=");
	builder.append(orderCnt);
	builder.append(", cafe_name=");
	builder.append(cafe_name);
	builder.append(", sales=");
	builder.append(sales);
	builder.append(", pdate=");
	builder.append(pdate);
	builder.append("]");
	return builder.toString();
}


}
