package com.web.store.ticket.model;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="Bank")
public class Bank {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private String bankName;
	@JsonIgnore
	private Blob bankImage;
	
	@Transient
	@OneToMany(fetch=FetchType.LAZY, mappedBy="Bank", cascade=CascadeType.ALL)
	private ArrayList<CreditCard> cards = new ArrayList<CreditCard>();
	
	public Bank() {
	}
	
	public Bank(Integer id, String bankName, Blob bankImage) {
		super();
		this.id = id;
		this.bankName = bankName;
		this.bankImage = bankImage;
	}



	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public Blob getBankImage() {
		return bankImage;
	}

	public void setBankImage(Blob bankImage) {
		this.bankImage = bankImage;
	}

	public ArrayList<CreditCard> getCards() {
		return cards;
	}

	public void setCards(ArrayList<CreditCard> cards) {
		this.cards = cards;
	}

	
}
