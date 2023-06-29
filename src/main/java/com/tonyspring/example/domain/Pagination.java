package com.tonyspring.example.domain;

public class Pagination {
	int count; // user테이블에 등록 된 총 user 수
	int page;
	int pageNum;
	int startPage;
	int endPage;
	int lastPage;
	int prevPage;
	int nextPage;
	public static final int pageUnit = 5;
	public static final int perPage = 3;
	
	public Pagination() {
		
	}
	
	public void init() {
		pageNum = (page - 1) * perPage;
		//1 = 0, 2 = 3, 3 = 6
		startPage = ((page - 1) / pageUnit) * pageUnit + 1;
		//페이지가 1~5일때 1, 페이지가 6~10일때는 6
		lastPage = (int)Math.ceil(count / (float)perPage);
		endPage = startPage + pageUnit - 1;
		endPage = endPage < lastPage ? endPage : lastPage;
		prevPage = (startPage - pageUnit);
		//스타트페이지가 1일때 -4? 스타트페이지가 6일때 4?
		nextPage = (startPage + pageUnit);
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
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

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public static int getPageunit() {
		return pageUnit;
	}

	public static int getPerpage() {
		return perPage;
	}
	
}
