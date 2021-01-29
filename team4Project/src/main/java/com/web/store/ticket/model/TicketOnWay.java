package com.web.store.ticket.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@Entity
@Table(name = "TicketOnWay")
public class TicketOnWay {
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "EventId")
	private Integer eventId;
	
	@Column(name = "PriceId")
	private Integer priceId;
	
	@Column(name = "SeatId")
	private Integer seatId;
	
	@Column(name = "Value")
	private Integer value;
	
	@Column(name = "DeleteTIme")
	private Timestamp deletedTime;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "OrderId")
	private TicketOrder ticketOrder;
	
	public TicketOnWay() {
		super();
	}
	
	public TicketOnWay(Integer eventId, Integer priceId, Integer seatId, Integer value,
			Timestamp deletedTime) {
		super();
		this.eventId = eventId;
		this.priceId = priceId;
		this.seatId = seatId;
		this.value = value;
		this.deletedTime = deletedTime;
	}
	
	public TicketOnWay(TicketOrder ticketOrder, Integer eventId, Integer priceId, Integer seatId, Integer value,
			Timestamp deletedTime) {
		super();
		this.ticketOrder = ticketOrder;
		this.eventId = eventId;
		this.priceId = priceId;
		this.seatId = seatId;
		this.value = value;
		this.deletedTime = deletedTime;
	}
	
	

	public TicketOnWay(Integer eventId, Integer priceId, Integer seatId, Integer value, Timestamp deletedTime,
			TicketOrder ticketOrder) {
		super();
		this.eventId = eventId;
		this.priceId = priceId;
		this.seatId = seatId;
		this.value = value;
		this.deletedTime = deletedTime;
		this.ticketOrder = ticketOrder;
	}

	public Integer getEventId() {
		return eventId;
	}

	public void setEventId(Integer eventId) {
		this.eventId = eventId;
	}

	public Integer getPriceId() {
		return priceId;
	}

	public void setPriceId(Integer priceId) {
		this.priceId = priceId;
	}

	public Integer getSeatId() {
		return seatId;
	}

	public void setSeatId(Integer seatId) {
		this.seatId = seatId;
	}

	public Integer getValue() {
		return value;
	}

	public void setValue(Integer value) {
		this.value = value;
	}

	public Timestamp getDeletedTime() {
		return deletedTime;
	}

	public void setDeletedTime(Timestamp deletedTime) {
		this.deletedTime = deletedTime;
	}

	public TicketOrder getTicketOrder() {
		return ticketOrder;
	}

	public void setTicketOrder(TicketOrder ticketOrder) {
		this.ticketOrder = ticketOrder;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	
	
}
