package com.web.store.campaign.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


public class SearchBean {
	
	private String searchStr;
	private Integer status;
	private String strDateStr;
	private String endDateStr;
	private Timestamp strDate;
	private Timestamp endDate;
	
	
	public void convertStringToTimestamp() {
		this.strDate = Timestamp.valueOf(strDateStr+" 00:00:00");
		this.endDate = Timestamp.valueOf(endDateStr+" 00:00:00");
	}
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Timestamp getStrDate() {
		return strDate;
	}
	public void setStrDate(Timestamp strDate) {
		this.strDate = strDate;
	}
	public Timestamp getEndDate() {
		return endDate;
	}
	public void setEndDate(Timestamp endDate) {
		this.endDate = endDate;
	}
	public String getSearchStr() {
		return searchStr;
	}
	public void setSearchStr(String searchStr) {
		this.searchStr = searchStr;
	}
	public String getStrDateStr() {
		return strDateStr;
	}
	public void setStrDateStr(String strDateStr) {
		this.strDateStr = strDateStr;
	}
	public String getEndDateStr() {
		return endDateStr;
	}
	public void setEndDateStr(String endDateStr) {
		this.endDateStr = endDateStr;
	}
	
}
