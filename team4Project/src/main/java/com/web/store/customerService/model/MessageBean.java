package com.web.store.customerService.model;

import java.util.Date;

public class MessageBean {
	
	private String toId;
	private String fromId;
	private String fromName;
	private String content;
	private Date sendDate;
	

	public String getToId() {
		return toId;
	}


	public void setToId(String toId) {
		this.toId = toId;
	}


	public String getFromId() {
		return fromId;
	}


	public void setFromId(String fromId) {
		this.fromId = fromId;
	}


	public String getFromName() {
		return fromName;
	}


	public void setFromName(String fromName) {
		this.fromName = fromName;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Date getSendDate() {
		return sendDate;
	}


	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}
	
	public String toString() {
		return this.content;
	}
	
	
}
