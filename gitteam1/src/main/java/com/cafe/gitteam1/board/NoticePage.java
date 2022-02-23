package com.cafe.gitteam1.board;

public class NoticePage {

	private int startNo;
	
	private int endNo;

	private int listSize = 10;
	
	private int blockSize = 5;
	
	private int totSize;
	
	private int startPage;
	
	private int endPage;
	
	private int totPage;
	
	private int nowPage;
	
	private String notice_search;
	
	private String notice_sort;
	
	public NoticePage() {
		this.nowPage = 1;
		this.notice_search = "";
	}
	
	public NoticePage(int nowPage, int totSize) {
		pageCompute();
		this.nowPage = nowPage;
		this.totSize = totSize;
	}
	
	
	public void pageCompute() {
		totPage = (int) Math.ceil(totSize / (double)listSize);
		endNo = nowPage * listSize;
		startNo = endNo - listSize + 1;
		if(endNo > totSize) endNo = totSize;
		
		endPage = (int) Math.ceil(nowPage / (double)blockSize) * blockSize;
		startPage = endPage - blockSize + 1;
		if(endPage > totPage) endPage = totPage;
	}
	
	public int getStartNo() {
		return startNo;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	public int getEndNo() {
		return endNo;
	}
	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}
	public int getListSize() {
		return listSize;
	}
	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	public int getTotSize() {
		return totSize;
	}
	public void setTotSize(int totSize) {
		this.totSize = totSize;
		pageCompute();
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getTotPage() {
		return totPage;
	}
	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public String getNotice_search() {
		return notice_search;
	}
	public void setNotice_search(String notice_search) {
		this.notice_search = notice_search;
	}
	public String getNotice_sort() {
		return notice_sort;
	}
	public void setNotice_sort(String notice_sort) {
		this.notice_sort = notice_sort;
	}

	@Override
	public String toString() {
		return "Page [startNo=" + startNo + ", endNo=" + endNo + ", listSize=" + listSize + ", blockSize=" + blockSize
				+ ", totSize=" + totSize + ", startPage=" + startPage + ", endPage=" + endPage + ", totPage=" + totPage
				+ ", nowPage=" + nowPage + ", notice_search=" + notice_search + ", notice_sort=" + notice_sort + "]";
	}
	
}
