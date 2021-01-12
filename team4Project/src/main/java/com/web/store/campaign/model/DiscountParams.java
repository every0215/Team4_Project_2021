package com.web.store.campaign.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

@Entity
@Table(name="DiscountParams")
public class DiscountParams implements Serializable{	
	
	
	private static final long serialVersionUID = 1L;
	
	@GenericGenerator(name = "generator", strategy = "foreign", parameters = @Parameter(name="property", value = "campaign"))
	@Id@Column(name = "ID")
	@GeneratedValue(generator = "generator")
	private Integer id;
	private Integer type;
	private Double offParam;
	private Integer amountOffParam;
	private Integer	amountUpTo;
	@OneToOne(fetch = FetchType.LAZY)
	@PrimaryKeyJoinColumn
	private Campaign campaign;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Double getOffParam() {
		return offParam;
	}
	public void setOffParam(Double offParam) {
		this.offParam = offParam;
	}
	public Integer getAmountOffParam() {
		return amountOffParam;
	}
	public void setAmountOffParam(Integer amountOffParam) {
		this.amountOffParam = amountOffParam;
	}
	public Integer getAmountUpTo() {
		return amountUpTo;
	}
	public void setAmountUpTo(Integer amountUpTo) {
		this.amountUpTo = amountUpTo;
	}
	public Campaign getCampaign() {
		return campaign;
	}
	public void setCampaign(Campaign campaign) {
		this.campaign = campaign;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	
	
}
