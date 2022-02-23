package com.cafe.gitteam1.search;

import java.util.List;

public class CafeInfoVo {
	private String cid;
	private String name;
	private String address;
	private String detail;
	private String thumb;
	private String lat;
	private String lng;
	private double distance;
	private int rcnt;
	private float rating;
	private List<ReviewVo> review;
	private String cond;
	private String offdate;
	private List<String> photos;
	
	
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getThumb() {
		return thumb;
	}
	public void setThumb(String thumb) {
		this.thumb = thumb;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	
	public double getDistance() {
		return distance;
	}
	public void setDistance(double distance) {
		this.distance = distance;
	}
	public float getRating() {
		return rating;
	}
	public void setRating(float rating) {
		this.rating = rating;
	}
	
	public int getRcnt() {
		return rcnt;
	}
	public void setRcnt(int rcnt) {
		this.rcnt = rcnt;
	}
	public List<ReviewVo> getReview() {
		return review;
	}
	public void setReview(List<ReviewVo> review) {
		this.review = review;
	}
	public String getCond() {
		return cond;
	}
	public void setCond(String cond) {
		this.cond = cond;
	}
	public String getOffdate() {
		return offdate;
	}
	public void setOffdate(String offdate) {
		this.offdate = offdate;
	}
	public List<String> getPhotos() {
		return photos;
	}
	public void setPhotos(List<String> photos) {
		this.photos = photos;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CafeInfoVo [cid=");
		builder.append(cid);
		builder.append(", name=");
		builder.append(name);
		builder.append(", address=");
		builder.append(address);
		builder.append(", detail=");
		builder.append(detail);
		builder.append(", thumb=");
		builder.append(thumb);
		builder.append(", lat=");
		builder.append(lat);
		builder.append(", lng=");
		builder.append(lng);
		builder.append(", distance=");
		builder.append(distance);
		builder.append(", rcnt=");
		builder.append(rcnt);
		builder.append(", rating=");
		builder.append(rating);
		builder.append(", review=");
		builder.append(review);
		builder.append(", cond=");
		builder.append(cond);
		builder.append(", offdate=");
		builder.append(offdate);
		builder.append(", photos=");
		builder.append(photos);
		builder.append("]");
		return builder.toString();
	}
	
}
