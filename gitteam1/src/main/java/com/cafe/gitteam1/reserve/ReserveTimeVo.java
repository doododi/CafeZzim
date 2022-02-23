package com.cafe.gitteam1.reserve;

public class ReserveTimeVo {
	int cid;
	String stime;
	int wtime;
	String offdate;
	String offstart;
	String offend;
	int offtime;
	String offtype;
	String cond;
	int seats2;
	int seats4;
	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	public int getWtime() {
		return wtime;
	}
	public void setWtime(int wtime) {
		this.wtime = wtime;
	}
	public String getOffdate() {
		return offdate;
	}
	public void setOffdate(String offdate) {
		this.offdate = offdate;
	}
	public String getOffstart() {
		return offstart;
	}
	public void setOffstart(String offstart) {
		this.offstart = offstart;
	}
	public String getOffend() {
		return offend;
	}
	public void setOffend(String offend) {
		this.offend = offend;
	}
	public int getOfftime() {
		return offtime;
	}
	public void setOfftime(int offtime) {
		this.offtime = offtime;
	}
	public String getOfftype() {
		return offtype;
	}
	public void setOfftype(String offtype) {
		this.offtype = offtype;
	}
	public String getCond() {
		return cond;
	}
	public void setCond(String cond) {
		this.cond = cond;
	}
	public int getSeats2() {
		return seats2;
	}
	public void setSeats2(int seats2) {
		this.seats2 = seats2;
	}
	public int getSeats4() {
		return seats4;
	}
	public void setSeats4(int seats4) {
		this.seats4 = seats4;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ReserveTimeVo [cid=");
		builder.append(cid);
		builder.append(", stime=");
		builder.append(stime);
		builder.append(", wtime=");
		builder.append(wtime);
		builder.append(", offdate=");
		builder.append(offdate);
		builder.append(", offstart=");
		builder.append(offstart);
		builder.append(", offend=");
		builder.append(offend);
		builder.append(", offtime=");
		builder.append(offtime);
		builder.append(", offtype=");
		builder.append(offtype);
		builder.append(", cond=");
		builder.append(cond);
		builder.append(", seats2=");
		builder.append(seats2);
		builder.append(", seats4=");
		builder.append(seats4);
		builder.append("]");
		return builder.toString();
	}
	
}
