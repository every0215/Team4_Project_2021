package com.web.store.ticket.model;

import java.sql.Timestamp;
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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "Sport")
public class Sport {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Transient
	@OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "eventId")
	private Event event;
	
	@Column(name = "eventId")
	private Integer eventId;
	
	@Column(name = "onSaleDate")
	private Timestamp onSaleDate;

	@Column(name = "offSaleDate")
	private Timestamp offSaleDate;
	
	@Column(name = "description")
	private String description;

	@Column(name = "cardId")
	private Integer cardId;
	
	@Transient
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="cardId")
	private CreditCard creditcard;
	
	@Column(name = "discountRatio")
	private Double discountRatio;
	
	@Transient
	@OneToMany(fetch=FetchType.LAZY, mappedBy="Sport", cascade=CascadeType.ALL)
	private Set<SportSession> sportSessions = new LinkedHashSet<SportSession>();
	
	public Sport() {
		
	}
	
	public Sport(Timestamp onSaleDate, Timestamp offSaleDate, String description, Integer cardId,Double discountRatio) {
		super();
		this.onSaleDate = onSaleDate;
		this.offSaleDate = offSaleDate;
		this.description = description;
		this.cardId = cardId;
		this.discountRatio = discountRatio;
	}

	public Sport(Integer eventId, Timestamp onSaleDate, Timestamp offSaleDate, String description, Integer cardId,Double discountRatio) {
		super();
		this.eventId = eventId;
		this.onSaleDate = onSaleDate;
		this.offSaleDate = offSaleDate;
		this.description = description;
		this.cardId = cardId;
		this.discountRatio = discountRatio;
	}

	public Sport(Integer id, Integer eventId, Timestamp onSaleDate, Timestamp offSaleDate, String description,
			Integer cardId,Double discountRatio) {
		super();
		this.id = id;
		this.eventId = eventId;
		this.onSaleDate = onSaleDate;
		this.offSaleDate = offSaleDate;
		this.description = description;
		this.cardId = cardId;
		this.discountRatio = discountRatio;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Event getEvent() {
		return event;
	}

	public void setEvent(Event event) {
		this.event = event;
	}

	public Integer getEventId() {
		return eventId;
	}

	public void setEventId(Integer eventId) {
		this.eventId = eventId;
	}

	public Timestamp getOnSaleDate() {
		return onSaleDate;
	}

	public void setOnSaleDate(Timestamp onSaleDate) {
		this.onSaleDate = onSaleDate;
	}

	public Timestamp getOffSaleDate() {
		return offSaleDate;
	}

	public void setOffSaleDate(Timestamp offSaleDate) {
		this.offSaleDate = offSaleDate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getCardId() {
		return cardId;
	}

	public void setCardId(Integer cardId) {
		this.cardId = cardId;
	}

	public CreditCard getCreditcard() {
		return creditcard;
	}

	public void setCreditcard(CreditCard creditcard) {
		this.creditcard = creditcard;
	}

	public Double getDiscountRatio() {
		return discountRatio;
	}

	public void setDiscountRatio(Double discountRatio) {
		this.discountRatio = discountRatio;
	}

	public Set<SportSession> getSportSessions() {
		return sportSessions;
	}

	public void setSportSessions(Set<SportSession> sportSessions) {
		this.sportSessions = sportSessions;
	}
	
	
}
