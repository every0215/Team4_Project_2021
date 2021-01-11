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
import javax.persistence.Transient;

@Entity
@Table(name = "SportSession")
public class SportSession {
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "sportId")
	private Integer sportId;
	
	@Transient
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="sportId")
	private Sport sport;
	
	@Transient
	@ManyToOne(fetch = FetchType.LAZY)
	private SportSeat sportSeat;
	
	@Column(name = "kickOfTime")
	private Timestamp kickOfTime;

	public SportSession() {
		super();
	}
	
	public SportSession( Timestamp kickOfTime) {
		super();
		this.kickOfTime = kickOfTime;
	}
	
	public SportSession(Integer sportId,Timestamp kickOfTime) {
		super();
		this.sportId = sportId;
		this.kickOfTime = kickOfTime;
	}

	public SportSession(Integer id, Integer sportId,Timestamp kickOfTime) {
		super();
		this.id = id;
		this.sportId = sportId;
		this.kickOfTime = kickOfTime;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getSportId() {
		return sportId;
	}

	public void setSportId(Integer sportId) {
		this.sportId = sportId;
	}

	public Sport getSport() {
		return sport;
	}

	public void setSport(Sport sport) {
		this.sport = sport;
	}

	public Timestamp getKickOfTime() {
		return kickOfTime;
	}

	public void setKickOfTime(Timestamp kickOfTime) {
		this.kickOfTime = kickOfTime;
	}
	
	
}
