package com.cafe.gitteam1.search;

public class SearchVo {
	
	private String findStr;
	private String date;
	private int startNo;
	private int listSize=10;
	private double centerLat;
	private double centerLng;
	private String sortBy;
	
	@Override
	public String toString() {
		return "SearchVo [findStr=" + findStr + ", date=" + date + ", startNo=" + startNo + ", listSize=" + listSize
				+ ", centerLat=" + centerLat + ", centerLng=" + centerLng + ", sortBy=" + sortBy + "]";
	}
	
	public String getFindStr() {
		return findStr;
	}
	public void setFindStr(String findStr) {
		this.findStr = findStr;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getStartNo() {
		return startNo;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	public int getListSize() {
		return listSize;
	}
	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	public double getCenterLat() {
		return centerLat;
	}
	public void setCenterLat(double centerLat) {
		this.centerLat = centerLat;
	}
	public double getCenterLng() {
		return centerLng;
	}
	public void setCenterLng(double centerLng) {
		this.centerLng = centerLng;
	}
	public String getSortBy() {
		return sortBy;
	}
	public void setSortBy(String sortBy) {
		this.sortBy = sortBy;
	}
}
