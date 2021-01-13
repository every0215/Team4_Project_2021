package com.web.store.campaign.model;

import java.sql.Timestamp;

public class queryBean {
	
	
	private String querySt;
	private int type;
	private Timestamp strDate;
	private Timestamp endDate;
	
	
	public String getQuerySt() {
		return querySt;
	}
	public void setQuerySt(String querySt) {
		this.querySt = querySt;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
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
	
	
}
