
package com.web.store.account.javabean;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

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
@Table(name="MCoinTopUpDetail")
public class MCoinTopUpDetail implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id @Column(name="ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name="PaymentMethod")
	private int paymentMethod;
	@Column(name="TopUpAmount")
	private BigDecimal topUpAmount;
	@Column(name="PaymentAmount")
	private BigDecimal paymentAmount;
	@Column
	private int creditCardId;
	@Column(name="TopupDate")
	private Timestamp topupDate;
	@Column(name="CreatedDate")
	private Timestamp createdDate;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "MemberId")
	@JsonIgnore
	private MemberBean member;
	


	
	public MCoinTopUpDetail(MemberBean member, int paymentMethod,BigDecimal topUpAmount, BigDecimal paymentAmount, Timestamp topupDate, Timestamp createdDate) {
		this.member = member;
		this.paymentMethod = paymentMethod;
		this.topUpAmount = topUpAmount;
		this.paymentAmount = paymentAmount;
		this.topupDate = topupDate;
		this.createdDate = createdDate;
	}
	
	public MCoinTopUpDetail() {
		// TODO Auto-generated constructor stub
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public int getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(int paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public BigDecimal getTopUpAmount() {
		return topUpAmount;
	}

	public void setTopUpAmount(BigDecimal topUpAmount) {
		this.topUpAmount = topUpAmount;
	}

	public BigDecimal getPaymentAmount() {
		return paymentAmount;
	}

	public void setPaymentAmount(BigDecimal paymentAmount) {
		this.paymentAmount = paymentAmount;
	}
	
	public int getCreditCardId() {
		return creditCardId;
	}

	public void setCreditCardId(int creditCardId) {
		this.creditCardId = creditCardId;
	}

	public Timestamp getTopupDate() {
		return topupDate;
	}

	public void setTopupDate(Timestamp topupDate) {
		this.topupDate = topupDate;
	}

	public Timestamp getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Timestamp createdDate) {
		this.createdDate = createdDate;
	}

	public MemberBean getMember() {
		return member;
	}

	public void setMember(MemberBean member) {
		this.member = member;
	}

}
