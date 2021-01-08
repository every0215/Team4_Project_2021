package com.web.store.campaign.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="campaign")
public class Campaign {
	
	@Id @Column(name="id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	private String title;

	private String picturePath;

	private String description;

	private String Content;

	private Timestamp startTime;

	private Timestamp endTime;
	
//	@JoinColumn(name = "type")
//	@ManyToOne
//	private DiscountType type;

	private Boolean status;

	private Timestamp addTime;

	private Timestamp updateTime;
//  與Company Bean連動，之後要記得加上getter、setter
//	@JoinColumn(name="companyId")
//	@ManyToOne
//	Company company;
//	int companyId;  //測試用之後刪掉

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPicturePath() {
		return picturePath;
	}

	public void setPicturePath(String picturePath) {
		this.picturePath = picturePath;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}

	public Timestamp getstartTime() {
		return startTime;
	}

	public void setstartTime(Timestamp startTime) {
		this.startTime = startTime;
	}

	public Timestamp getendTime() {
		return endTime;
	}

	public void setendTime(Timestamp endTime) {
		this.endTime = endTime;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public Timestamp getAddTime() {
		return addTime;
	}

	public void setAddTime(Timestamp addTime) {
		this.addTime = addTime;
	}

	public Timestamp getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}
	
	
}
