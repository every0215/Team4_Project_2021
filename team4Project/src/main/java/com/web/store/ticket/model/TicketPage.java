package com.web.store.ticket.model;

import java.util.List;

public class TicketPage <E>{
	
	private Integer totalpage;
	private Integer currentPage;
	private Integer pageSize=6;
	private Integer TotalResultCount;
	private List<E> content;
	
	
	public TicketPage(Integer totalpage, Integer currentPage, List<E> content) {
		super();
		this.totalpage = totalpage;
		this.currentPage = currentPage;
		this.content = content;
	}
	
	public TicketPage() {		
	}
	
	public Integer getTotalpage() {
		return totalpage;
	}
	public void setTotalpage(Integer totalpage) {
		this.totalpage = totalpage;
	}
	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	public List<E> getContent() {
		return content;
	}
	public void setContent(List<E> content) {
		this.content = content;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getTotalResultCount() {
		return TotalResultCount;
	}

	public void setTotalResultCount(Integer totalResultCount) {
		TotalResultCount = totalResultCount;
	}
	
	
}
