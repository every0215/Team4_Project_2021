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
import javax.persistence.Transient;

@Entity
@Table(name="Price")
public class Price{
	
	@Id @Column(name="id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name="eventId")
	private Integer eventId;
	
	@Transient
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="eventId")
	private Event event;
	
	@Column(name="name")
	private String name;
	@Column(name="cost")
	private Integer cost;
	
	@Transient
	@ManyToOne(fetch = FetchType.LAZY)
	SportSeat sportseat;
	
	public Price() {
		
	}
	
	public Price(Integer id,Integer eventId,String name,Integer cost) {
		this.id = id;
		this.eventId = eventId;
		this.name = name;
		this.cost = cost;
	}
	
	public Price(Integer eventId,String name,Integer cost) {
		this.eventId = eventId;
		this.name = name;
		this.cost = cost;
	}
	
	public Price(String name,Integer cost) {
		
		this.name = name;
		this.cost = cost;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getCost() {
		return cost;
	}

	public void setCost(Integer cost) {
		this.cost = cost;
	}
	
	public Event getEvent() {
		return event;
	}

	public void setEvent(Event event) {
		this.event = event;
	}
}
