
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
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="Member")
public class MemberBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id @Column(name="ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name="Fullname")
	private String fullname;
	@Column(name="Nickname")
	private String nickname;
	@Column(name="Qid")
	private String qid;
	@Column(name="Mobile")
	private String mobile;
	@Column(name="Country")
	private String country;
	@Column(name="City")
	private String city;
	@Column(name="Address")
	private String address;
	@Column(name="Email")
	private String email;
	@Column(name="Password")
	private byte[] password;
	
	private String pwd;

	@Column(name="MobileVerifCode")
	private String mobileVerifCode;
	@Column(name="EmailVerifCode")
	private String emailVerifCode;
	
	@Column(name="ProfileImage1")
	@JsonIgnore
	private byte[] profileImage1;
	
	@Column(name="ProfileImage2")
	@JsonIgnore
	private byte[] profileImage2;
	
	@Column(name="ProfileImage3")
	@JsonIgnore
	private byte[] profileImage3;
	
	@Column(name="Active")
	private boolean active;
	@Column(name="CreatedDate")
	private Timestamp createdDate;
	@Column(name="ModifiedDate")
	private Timestamp modifiedDate;
	@OneToMany(fetch=FetchType.EAGER, mappedBy = "member", cascade=CascadeType.ALL)
	private List<MemberLoginHistory> memberLoginHistory;
	

	public MemberBean(String fullname, String nickname,String qid, String email,byte[] password) {
		this.fullname = fullname;
		this.nickname = nickname;
		this.qid = qid;
		this.email = email;
		this.password = password;
	}
	
	public MemberBean() {
		// TODO Auto-generated constructor stub
	}


	
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getFullname() {
		return fullname;
	}


	public void setFullname(String fullname) {
		this.fullname = fullname;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getQid() {
		return qid;
	}


	public void setQid(String qid) {
		this.qid = qid;
	}


	public String getMobile() {
		return mobile;
	}


	public void setMobile(String mobile) {
		this.mobile = mobile;
	}


	public String getCountry() {
		return country;
	}


	public void setCountry(String country) {
		this.country = country;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public byte[] getPassword() {
		return password;
	}


	public void setPassword(byte[] password) {
		this.password = password;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getMobileVerifCode() {
		return mobileVerifCode;
	}


	public void setMobileVerifCode(String mobileVerifCode) {
		this.mobileVerifCode = mobileVerifCode;
	}


	public String getEmailVerifCode() {
		return emailVerifCode;
	}


	public void setEmailVerifCode(String emailVerifCode) {
		this.emailVerifCode = emailVerifCode;
	}


	public byte[] getProfileImage1() {
		return profileImage1;
	}


	public void setProfileImage1(byte[] profileImage1) {
		this.profileImage1 = profileImage1;
	}


	public byte[] getProfileImage2() {
		return profileImage2;
	}
	

	public void setProfileImage2(byte[] profileImage2) {
		this.profileImage2 = profileImage2;
	}


	public byte[] getProfileImage3() {
		return profileImage3;
	}


	public void setProfileImage3(byte[] profileImage3) {
		this.profileImage3 = profileImage3;
	}


	public boolean isActive() {
		return active;
	}


	public void setActive(boolean active) {
		this.active = active;
	}


	public Timestamp getCreatedDate() {
		return createdDate;
	}


	public void setCreatedDate(Timestamp createdDate) {
		this.createdDate = createdDate;
	}


	public Timestamp getModifiedDate() {
		return modifiedDate;
	}


	public void setModifiedDate(Timestamp modifiedDate) {
		this.modifiedDate = modifiedDate;
	}
	
	
	public List<MemberLoginHistory> getMemberLoginHistory() {
		return memberLoginHistory;
	}

	public void setMemberLoginHistory(List<MemberLoginHistory> memberLoginHistory) {
		this.memberLoginHistory = memberLoginHistory;
	}

}
