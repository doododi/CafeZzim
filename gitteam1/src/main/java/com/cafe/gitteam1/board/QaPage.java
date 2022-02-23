package com.cafe.gitteam1.board;

public class QaPage {
	
	private int startNo;
	
	private int endNo;
	
	private int listSize = 10;
	
	private int blockSize = 5;
	
	private int totSize;
	
	private int startPage;
	
	private int endPage;
	
	private int totPage;
	
	private int nowPage;
	
	private String qa_search;
	
	private String qa_sort;

	public QaPage() {
		this.nowPage = 1;
		this.qa_search = "";
	}
	
	public QaPage(int nowPage, int totSize) {
		pageCompute();
		this.nowPage = nowPage;
		this.totSize = totSize;
	}
	
	public void pageCompute() {
		totPage = (int) Math.ceil(totSize / (double)listSize);
		endNo = nowPage * listSize;
		startNo = endNo - listSize + 1;
		if(endNo > startNo) endNo = totSize;
		
		endPage = (int) Math.ceil(nowPage / (double)blockSize) * blockSize;
		startPage = endPage - blockSize + 1;
		if(endPage > startPage) endPage = totPage;
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
	public String getQa_search() {
		return qa_search;
	}
	public void setQa_search(String qa_search) {
		this.qa_search = qa_search;
	}
	public String getQa_sort() {
		return qa_sort;
	}
	public void setQa_sort(String qa_sort) {
		this.qa_sort = qa_sort;
	}
	
	@Override
	public String toString() {
		return "QaPage [startNo=" + startNo + ", endNo=" + endNo + ", listSize=" + listSize + ", blockSize=" + blockSize
				+ ", totSize=" + totSize + ", startPage=" + startPage + ", endPage=" + endPage + ", totPage=" + totPage
				+ ", nowPage=" + nowPage + ", qa_search=" + qa_search + ", qa_sort=" + qa_sort + "]";
	}
	
}
