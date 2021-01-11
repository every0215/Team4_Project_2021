package com.web.store.ticket.model;

import java.util.LinkedHashSet;
import java.util.Set;

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
import javax.persistence.Transient;

@Entity
@Table(name = "SportSeat")
public class SportSeat {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Transient
	@OneToMany(fetch=FetchType.LAZY, mappedBy="SportSeat", cascade=CascadeType.ALL)
	@JoinColumn(name="priceId")
	private Set<Price> prices = new LinkedHashSet<Price>();
	
	@Column(name = "priceId")
	private Integer priceId;
	
	@Transient
	@OneToMany(fetch=FetchType.LAZY, mappedBy="SportSeat", cascade=CascadeType.ALL)
	@JoinColumn(name="SportSession")
	private Set<SportSession> sessions = new LinkedHashSet<SportSession>();
	
	@Column(name = "sessionId")
	private Integer sessionId;
	
	@Column(name = "seatNo")//票券張數
	private Integer seatNo;
	
	

	public SportSeat() {
		super();
	}
	
	public SportSeat(Integer priceId, Integer sessionId, Integer seatNo) {
		super();
		this.priceId = priceId;
		this.sessionId = sessionId;
		this.seatNo = seatNo;
	}

	public SportSeat(Integer id, Integer priceId, Integer sessionId, Integer seatNo) {
		super();
		this.id = id;
		this.priceId = priceId;
		this.sessionId = sessionId;
		this.seatNo = seatNo;
	}



	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getPriceId() {
		return priceId;
	}

	public void setPriceId(Integer priceId) {
		this.priceId = priceId;
	}

	public Integer getSessionId() {
		return sessionId;
	}

	public void setSessionId(Integer sessionId) {
		this.sessionId = sessionId;
	}

	public Integer getSeatNo() {
		return seatNo;
	}

	public void setSeatNo(Integer seatNo) {
		this.seatNo = seatNo;
	}
	
	
}
