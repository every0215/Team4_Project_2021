package com.web.store.ticket.model;

import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Column;
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

@Entity
@Table(name = "Exhibition")
public class Exhibition {

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

	@Column(name = "commDate")
	private Date commDate;

	@Column(name = "dueDate")
	private Date dueDate;

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

	public Exhibition() {

	}

	public Exhibition(Integer id, Integer eventId, Timestamp onSaleDate, Timestamp offSaleDate, Date commDate,
			Date dueDate, String description, Integer cardId, Double discountRatio) {
		this.id = id;
		this.eventId = eventId;
		this.onSaleDate = onSaleDate;
		this.offSaleDate = offSaleDate;
		this.commDate = commDate;
		this.dueDate = dueDate;
		this.description = description;
		this.cardId = cardId;
		this.discountRatio = discountRatio;

	}

	public Exhibition(Integer eventId, Timestamp onSaleDate, Timestamp offSaleDate, Date commDate, Date dueDate,
			String description, Integer cardId, Double discountRatio) {
		this.eventId = eventId;
		this.onSaleDate = onSaleDate;
		this.offSaleDate = offSaleDate;
		this.commDate = commDate;
		this.dueDate = dueDate;
		this.description = description;
		this.cardId = cardId;
		this.discountRatio = discountRatio;

	}

	public Exhibition(Timestamp onSaleDate, Timestamp offSaleDate, Date commDate, Date dueDate, String description,
			Integer cardId, Double discountRatio) {

		this.onSaleDate = onSaleDate;
		this.offSaleDate = offSaleDate;
		this.commDate = commDate;
		this.dueDate = dueDate;
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

	public Date getCommDate() {
		return commDate;
	}

	public void setCommDate(Date commDate) {
		this.commDate = commDate;
	}

	public Date getDueDate() {
		return dueDate;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
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


	public Event getEvent() {
		return event;
	}

	public void setEvent(Event event) {
		this.event = event;
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
}
