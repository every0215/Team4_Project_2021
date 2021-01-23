
package com.web.store.account.javabean;

import java.io.Serializable;
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
@Table(name="MemberCreditCard")
public class MemberCreditCard implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id @Column(name="ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name="CardNo")
	private String cardNo;
	@Column(name="OwnerName")
	private String ownerName;
	@Column(name="ExpireDateMM")
	private String expireDateMM;
	@Column(name="ExpireDateYY")
	private String expireDateYY;
	@Column(name="CVV")
	private String cvv;
	@Column(name="CreatedDate")
	private Timestamp createdDate;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "MemberId")
	@JsonIgnore
	private MemberBean member;
	

	public MemberCreditCard(MemberBean member, String cardNo,String ownerName, String expireDateMM, String expireDateYY, String cvv) {
		this.member = member;
		this.cardNo = cardNo;
		this.ownerName = ownerName;
		this.expireDateMM = expireDateMM;
		this.expireDateYY = expireDateYY;
		this.cvv = cvv;
	}
	
	public MemberCreditCard() {
		// TODO Auto-generated constructor stub
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public String getOwnerName() {
		return ownerName;
	}

	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}

	public String getExpireDateMM() {
		return expireDateMM;
	}

	public void setExpireDateMM(String expireDateMM) {
		this.expireDateMM = expireDateMM;
	}

	public String getExpireDateYY() {
		return expireDateYY;
	}

	public void setExpireDateYY(String expireDateYY) {
		this.expireDateYY = expireDateYY;
	}

	public String getCVV() {
		return cvv;
	}

	public void setCVV(String cvv) {
		this.cvv = cvv;
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
