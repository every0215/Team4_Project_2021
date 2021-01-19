package com.web.store.campaign.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.web.store.company.model.Company;

@Entity
@Table(name = "Campaign")
public class Campaign implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	private String name;

	private String picturePath;

	private String description;

	private String content;

	@Transient
	private String startDate;
	@Transient
	private String startTime;
	@Transient
	private String endDate;
	@Transient
	private String endTime;

	private Timestamp startDateTime;

	private Timestamp endDateTime;

	private Boolean launchStatus;

	private Boolean status;

	private Timestamp addTime;

	private Timestamp updateTime;

	@JoinColumn(name = "companyId")
	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JsonIgnore
	private Company company;

	@OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "campaign")
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

	public Campaign(Integer id, String name, String picturePath, String description, String content,
			Timestamp startDateTime, Timestamp endDateTime, Boolean launchStatus, Boolean status, Timestamp updateTime,
			Company company, DiscountParams discountParams) {
		super();
		this.id = id;
		this.name = name;
		this.picturePath = picturePath;
		this.description = description;
		this.content = content;
		this.startDateTime = startDateTime;
		this.endDateTime = endDateTime;
		this.launchStatus = launchStatus;
		this.status = status;
		this.updateTime = updateTime;
		this.company = company;
		this.discountParams = discountParams;
	}

	public Campaign(String name, String picturePath, String description, String content, Timestamp startDateTime,
			Timestamp endDateTime, Boolean launchStatus, Boolean status, Timestamp addTime, Timestamp updateTime,
			Company company, DiscountParams discountParams) {
		super();
		this.name = name;
		this.picturePath = picturePath;
		this.description = description;
		this.content = content;
		this.startDateTime = startDateTime;
		this.endDateTime = endDateTime;
		this.launchStatus = launchStatus;
		this.status = status;
		this.addTime = addTime;
		this.updateTime = updateTime;
		this.company = company;
		this.discountParams = discountParams;
	}

	public Campaign() {

	}

	// 將timestamp物件猜分為yyyy-MM-dd 和 HH:mm型式的字串
	public void convertTimestampToString() {
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		this.startDate = sdf1.format(startDateTime.getTime());
		this.endDate = sdf1.format(endDateTime.getTime());

		SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm");
		this.startTime = sdf2.format(startDateTime.getTime());
		this.endTime = sdf2.format(endDateTime.getTime());
	}
	
	public void convertStringToTimestamp() {
		this.startDateTime = Timestamp.valueOf(this.startDate+" "+this.startTime+":00");
		this.endDateTime = Timestamp.valueOf(this.endDate+" "+this.endTime+":00");
	}

	// 判斷活動狀態、時間內
	public Boolean isActive() {
		Date date = new Date();
		Timestamp currentTime = new Timestamp(date.getTime());

		if (!status) {
			return false;
		}

		if (currentTime.compareTo(startDateTime) > 0 && currentTime.compareTo(endDateTime) < 0) {
			return true;
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

	public Timestamp getStartDateTime() {
		return startDateTime;
	}

	public void setStartDateTime(Timestamp startDateTime) {
		this.startDateTime = startDateTime;
	}

	public Timestamp getEndDateTime() {
		return endDateTime;
	}

	public void setEndDateTime(Timestamp endDateTime) {
		this.endDateTime = endDateTime;
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

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

}
