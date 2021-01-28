
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
@Table(name="MemberNotification")
public class MemberNotification implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id @Column(name="Id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name="Type")
	private int type;
	@Column(name="Title")
	private String title;
	@Column(name="Description")
	private String description;
	@Column(name="IsRead")
	private Boolean read;
	@Column(name="Url")
	private String url;
	@Column(name="CreatedDate")
	private Timestamp createdDate;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "MemberId")
	@JsonIgnore
	private MemberBean member;
	

	public MemberNotification(MemberBean member, int type,String title, String description) {
		this.member = member;
		this.type = type;
		this.title = title;
		this.description = description;
	}
	
	public MemberNotification() {
		// TODO Auto-generated constructor stub
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Boolean getRead() {
		return read;
	}

	public void setRead(Boolean read) {
		this.read = read;
	}
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
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
