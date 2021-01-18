package com.web.store.ticket.model;

import java.sql.Blob;
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
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="CreditCard")
public class CreditCard {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private String cardName;
	
	@JsonIgnore
	private Integer bankId;
	
	@JsonIgnore
	@Transient
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="bankId")
	private Bank bank;
	@JsonIgnore
	private Blob cardImage;
	
	@JsonIgnore
	@Transient
	@OneToMany(fetch=FetchType.LAZY, mappedBy="CreditCard", cascade=CascadeType.ALL)
	private Set<Exhibition> exhibitions = new LinkedHashSet<Exhibition>();
	
	@JsonIgnore
	@Transient
	@OneToMany(fetch=FetchType.LAZY, mappedBy="CreditCard", cascade=CascadeType.ALL)
	private Set<Sport> sports = new LinkedHashSet<Sport>();
	
	public CreditCard() {
		
	}
	
	public CreditCard(Integer id, String cardName, Integer bankId, Blob cardImage) {
		super();
		this.id = id;
		this.cardName = cardName;
		this.bankId = bankId;
		this.cardImage = cardImage;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCardName() {
		return cardName;
	}

	public void setCardName(String cardName) {
		this.cardName = cardName;
	}

	public Integer getBankId() {
		return bankId;
	}

	public void setBankId(Integer bankId) {
		this.bankId = bankId;
	}

	public Bank getBank() {
		return bank;
	}

	public void setBank(Bank bank) {
		this.bank = bank;
	}

	public Blob getCardImage() {
		return cardImage;
	}

	public void setCardImage(Blob cardImage) {
		this.cardImage = cardImage;
	}

	public Set<Exhibition> getExhibitions() {
		return exhibitions;
	}

	public void setExhibitions(Set<Exhibition> exhibitions) {
		this.exhibitions = exhibitions;
	}
	
	
}
