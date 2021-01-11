package com.web.store.campaign.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.web.store.company.model.Company;

@Entity
@Table(name="campaign")
public class Campaign implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id @Column(name="id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	private String name;

	private String picturePath;

	private String description;

	private String content;

	private Timestamp startTime;

	private Timestamp endTime;

	private Boolean launchStatus;

	private Boolean status;

	private Timestamp addTime;

	private Timestamp updateTime;
		
	@JoinColumn(name="companyId")
	@ManyToOne(cascade = CascadeType.ALL)
	@JsonIgnore
	private Company company;
	
	@OneToOne(fetch = FetchType.LAZY,cascade = CascadeType.ALL,mappedBy = "campaign")
	@JsonIgnore
	private DiscountParams discountParams;
		
//	//商品活動多對多映射，之後補上
//	@ManyToMany(cascade=CascadeType.ALL,mappedBy = "campaign",fetch = FetchType.LAZY)
//    @JoinTable(
//        name="product_campaign",
//        joinColumns={@JoinColumn(name="campaignId")},
//        inverseJoinColumns={@JoinColumn(name="productId")}
//    )
//	private set<Product> products;

	
	
	public Integer getId() {
		return id;
	}


	public Campaign(String name, String picturePath, String description, String content, Timestamp startTime,
		Timestamp endTime, Boolean launchStatus, Boolean status, Timestamp addTime, Timestamp updateTime,
		Company company, DiscountParams discountParams) {
		super();
		this.name = name;
		this.picturePath = picturePath;
		this.description = description;
		this.content = content;
		this.startTime = startTime;
		this.endTime = endTime;
		this.launchStatus = launchStatus;
		this.status = status;
		this.addTime = addTime;
		this.updateTime = updateTime;
		this.company = company;
		this.discountParams = discountParams;
	}

	public Campaign() {
		
	}
	
	public boolean isActive() {
		Date currentDate = new Date();
		Timestamp currentStamp = new Timestamp(currentDate.getTime());
		
		if(!(launchStatus && status)) {
			return false;
		}else {
			if(currentStamp.compareTo(startTime)>0 && currentStamp.compareTo(endTime)>0) {
				return true;
			}
		}	
		return false;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getStartTime() {
		return startTime;
	}

	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}

	public Timestamp getEndTime() {
		return endTime;
	}

	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}

	public Boolean getLaunchStatus() {
		return launchStatus;
	}

	public void setLaunchStatus(Boolean launchStatus) {
		this.launchStatus = launchStatus;
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

	public DiscountParams getDiscountParams() {
		return discountParams;
	}

	public void setDiscountParams(DiscountParams discountParams) {
		this.discountParams = discountParams;
	}
	
	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

//	public Company getCompany() {
//		return company;
//	}
//
//	public void setCompany(Company company) {
//		this.company = company;
//	}

	
	
}
