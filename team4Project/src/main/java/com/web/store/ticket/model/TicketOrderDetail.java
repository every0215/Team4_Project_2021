package com.web.store.ticket.model;

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
@Table(name = "TicketOrderDetail")
public class TicketOrderDetail {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "EventId")
	private Integer eventId;
	
	@Column(name = "PriceId")
	private Integer priceId;
	
	@Column(name = "Discount")
	private Integer discount;
	
	@Column(name = "SeatId")
	private Integer seatId;
	
	@Column(name = "Value")
	private Integer value;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "OrderId")
	private TicketOrder ticketOrder;


	public TicketOrderDetail() {
		super();
	}
	
	public TicketOrderDetail(Integer eventId, Integer priceId, Integer discount, Integer seatId, Integer value
			) {
		super();
		this.eventId = eventId;
		this.priceId = priceId;
		this.discount = discount;
		this.seatId = seatId;
		this.value=value;
		
	}

	public TicketOrderDetail(TicketOrder ticketOrder, Integer eventId, Integer priceId, Integer discount, Integer seatId, Integer value) {
		super();
		this.ticketOrder = ticketOrder;
		this.eventId = eventId;
		this.priceId = priceId;
		this.discount = discount;
		this.seatId = seatId;
		this.value=value;
		
	}

	public TicketOrderDetail(Integer id, Integer eventId, Integer priceId, Integer discount, Integer seatId, Integer value,
			TicketOrder ticketOrder) {
		super();
		this.id = id;
		this.eventId = eventId;
		this.priceId = priceId;
		this.discount = discount;
		this.seatId = seatId;
		this.value=value;
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

	public Integer getDiscount() {
		return discount;
	}

	public void setDiscount(Integer discount) {
		this.discount = discount;
	}

	public Integer getSeatId() {
		return seatId;
	}

	public void setSeatId(Integer seatId) {
		this.seatId = seatId;
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

	public Integer getValue() {
		return value;
	}

	public void setValue(Integer value) {
		this.value = value;
	}
	
	
}
