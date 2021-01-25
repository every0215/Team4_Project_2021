
package com.web.store.account.javabean;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

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
	
	@Transient
	private String origpwd;
	
	@Transient
	private String pwd;
	
	@Transient
	private String pwd2;

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
	
	@Transient
	private String profileImage1Base64;
	@Transient
	private String profileImage1Path;
	
	@Transient
	private String profileImage2Base64;

	@Transient
	private String profileImage3Base64;
	
	@Column(name="Verified", nullable = false, columnDefinition = "BIT", length = 1)
	private Boolean verified;

	@Column(name="Active", nullable = false, columnDefinition = "BIT", length = 1)
	private Boolean active;
	
	@Column(name="CreatedDate")
	private Timestamp createdDate;
	@Column(name="ModifiedDate")
	private Timestamp modifiedDate;
	@OneToMany(fetch=FetchType.EAGER, mappedBy = "member", cascade=CascadeType.ALL)
	private Set<MemberLoginHistory> memberLoginHistoryList;
	
	@OneToMany(fetch=FetchType.EAGER, mappedBy = "member", cascade=CascadeType.ALL)
	private Set<MemberCreditCard> memberCreditCardList;
	
	@OneToMany(fetch=FetchType.EAGER, mappedBy = "member", cascade=CascadeType.ALL)
	private Set<MCoinTopUpDetail> mCoinTopupDetailList;
	
	@OneToOne(fetch=FetchType.LAZY, mappedBy = "member", cascade = CascadeType.ALL)
	private MCoin mCoin;
	
	@OneToMany(fetch=FetchType.EAGER, mappedBy = "member", cascade=CascadeType.ALL)
	private Set<MemberSubscription> memberSubscriptionList;
	

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
	
	public String getOrigpwd() {
		return origpwd;
	}

	public void setOrigpwd(String origpwd) {
		this.origpwd = origpwd;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public String getPwd2() {
		return pwd2;
	}

	public void setPwd2(String pwd2) {
		this.pwd2 = pwd2;
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

	public String getProfileImage1Path() {
		return profileImage1Path;
	}

	public void setProfileImage1Path(String profileImage1Path) {
		this.profileImage1Path = profileImage1Path;
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

	public String getProfileImage1Base64() {
		return profileImage1Base64;
	}

	public void setProfileImage1Base64(String profileImage1Base64) {
		this.profileImage1Base64 = profileImage1Base64;
	}

	public String getProfileImage2Base64() {
		return profileImage2Base64;
	}

	public void setProfileImage2Base64(String profileImage2Base64) {
		this.profileImage2Base64 = profileImage2Base64;
	}

	public String getProfileImage3Base64() {
		return profileImage3Base64;
	}

	public void setProfileImage3Base64(String profileImage3Base64) {
		this.profileImage3Base64 = profileImage3Base64;
	}

	
	public Boolean isVerified() {
		if(verified == null) verified = false;
		return this.verified;
	}

	public void setVerified(Boolean verified) {
		this.verified = verified;
		if(verified == null) this.verified = false;
	}
	
	public Boolean isActive() {
		if(active == null) active = false;
		return this.active;
	}

	public void setActive(Boolean active) {
		this.active = active;
		if(active == null) this.active = false;
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
	
	public Set<MemberLoginHistory> getMemberLoginHistoryList() {
		return memberLoginHistoryList;
	}

	public void setMemberLoginHistoryList(Set<MemberLoginHistory> memberLoginHistoryList) {
		this.memberLoginHistoryList = memberLoginHistoryList;
	}

	public Set<MemberCreditCard> getMemberCreditCardList() {
		return memberCreditCardList;
	}

	public void setMemberCreditCardList(Set<MemberCreditCard> memberCreditCardList) {
		this.memberCreditCardList = memberCreditCardList;
	}

	public Set<MCoinTopUpDetail> getmCoinTopupDetailList() {
		return mCoinTopupDetailList;
	}

	public void setmCoinTopupDetailList(Set<MCoinTopUpDetail> mCoinTopupDetailList) {
		this.mCoinTopupDetailList = mCoinTopupDetailList;
	}

	public MCoin getmCoin() {
		return mCoin;
	}

	public void setmCoin(MCoin mCoin) {
		this.mCoin = mCoin;
	}

	public Set<MemberSubscription> getMemberSubscriptionList() {
		return memberSubscriptionList;
	}

	public void setMemberSubscriptionList(Set<MemberSubscription> memberSubscriptionList) {
		this.memberSubscriptionList = memberSubscriptionList;
	}
	
	
}
