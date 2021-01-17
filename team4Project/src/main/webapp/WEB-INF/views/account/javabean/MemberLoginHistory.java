
package com.web.store.account.javabean;

import java.io.InputStream;
import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
@Table(name="MemberLoginHistory")
public class MemberLoginHistory implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id @Column(name="ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column
	private Date loginTime;
	@Column
	private String device;
	@Column
	private String location;
	@Column
	private String ip;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "MemberId")
	@JsonIgnore
	private MemberBean member;

	
	public MemberLoginHistory() {
		// TODO Auto-generated constructor stub
	}

	
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}

	public Date getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}

	public String getDevice() {
		return device;
	}

	public void setDevice(String device) {
		this.device = device;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	
	public MemberBean getMember() {
		return member;
	}

	public void setMember(MemberBean member) {
		this.member = member;
	}

}
