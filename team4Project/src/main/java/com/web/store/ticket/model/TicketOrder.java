package com.web.store.ticket.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "TicketOrder")
public class TicketOrder {
	@Id
	@Column(name = "Id")
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	@GeneratedValue(generator = "fendo_Generator")
	@GenericGenerator(name = "fendo_Generator", strategy = "guid")
	private String id;
	@Column(name = "MemberId")
	private Integer memberId;
	@Column(name = "Status")
	private Integer status;
	@Column(name = "ValidTime")
	private Timestamp validTime;
	@Column(name = "TotalCost")
	private Integer totalCost;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "ticketOrder", cascade = CascadeType.ALL)
	private List<TicketOrderDetail> ticketOrderDetails = new ArrayList<TicketOrderDetail>();
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "ticketOrder", cascade = CascadeType.ALL)
	private List<TicketOnWay> ticketOnWays = new ArrayList<TicketOnWay>();
	
	public TicketOrder() {
	}
	
	public TicketOrder(String id, Integer memberId, Integer status,Integer totalCost) {
		super();
		this.id = id;
		this.memberId = memberId;
		this.status = status;
		this.totalCost = totalCost;
	}
	
	public TicketOrder(Integer memberId, Integer status, Timestamp validTime,Integer totalCost) {
		super();
		this.memberId = memberId;
		this.status = status;
		this.validTime = validTime;
		this.totalCost = totalCost;
	}
	
	public TicketOrder(String id, Integer memberId, Integer status, Timestamp validTime,Integer totalCost) {
		super();
		this.id = id;
		this.memberId = memberId;
		this.status = status;
		this.validTime = validTime;
		this.totalCost = totalCost;
	}
	
	
	
	public TicketOrder(Integer memberId, Integer status, Timestamp validTime, Integer totalCost,
			List<TicketOrderDetail> ticketOrderDetails, List<TicketOnWay> ticketOnWays) {
		super();
		this.memberId = memberId;
		this.status = status;
		this.validTime = validTime;
		this.totalCost = totalCost;
		this.ticketOrderDetails = ticketOrderDetails;
		this.ticketOnWays = ticketOnWays;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Timestamp getValidTime() {
		return validTime;
	}
	public void setValidTime(Timestamp validTime) {
		this.validTime = validTime;
	}
	
	

	public Integer getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(Integer totalCost) {
		this.totalCost = totalCost;
	}

	public List<TicketOrderDetail> getTicketOrderDetails() {
		return ticketOrderDetails;
	}

	public void setTicketOrderDetails(List<TicketOrderDetail> ticketOrderDetails) {
		this.ticketOrderDetails = ticketOrderDetails;
	}

	public List<TicketOnWay> getTicketOnWays() {
		return ticketOnWays;
	}

	public void setTicketOnWays(List<TicketOnWay> ticketOnWays) {
		this.ticketOnWays = ticketOnWays;
	}
	
	
	
}
