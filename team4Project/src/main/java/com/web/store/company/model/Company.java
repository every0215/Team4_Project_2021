package com.web.store.company.model;

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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GeneratorType;

import com.web.store.ticket.model.Event;
import com.web.store.campaign.model.Campaign;


@Entity
@Table(name="company")
public class Company {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name= "Id")
	private int Id;
	@Column(name= "Company")
	private String company;
	@Column(name= "Logo")
	private Blob logo;
	@Column(name= "UniformNumbers")
	private String uniformNumbers;
	@Column(name= "Categories")
	private String categories;
	@Column(name= "Account")
	private String Account;
	@Column(name= "Password")
	private String Password;
	@Column(name= "Email")
	private String email;
	@Column(name= "Phone")
	private String phone;
	@Column(name= "BusRC")
	private Blob busRC;
	@Column(name= "BankId")
	private int bankId;
	@Column(name= "Profile")
	private String Profile;
	@Column(name= "Status")
	private boolean Status;//企業的上下架狀態，只有1或0
	
	@OneToMany(cascade = CascadeType.ALL,mappedBy = "company")
	private Set<Campaign> campaigns;
	
	@Transient
	@OneToMany(fetch=FetchType.LAZY, mappedBy="COMPANY", cascade=CascadeType.ALL)
	 private Set<Event> events = new LinkedHashSet<Event>();
	
	public Company() {
		
	}
	//以下可以先註解掉
	//以下可以先註解掉
	//以下可以先註解掉
	//以下可以先註解掉
	//以下可以先註解掉
	//以下可以先註解掉
	//以下可以先註解掉
	
	
	//Query
//	public Company(int Id, String company, String uniformNumbers, String categories,
//			String account, String password, String email, String phone, int bankId) {
//		super();
//		this.Id = Id;
//		this.company = company;
//		
//		this.uniformNumbers = uniformNumbers;
//		this.categories = categories;
//		this.account = account;
//		this.password = password;
//		this.email = email;
//		this.phone = phone;
//		
//		this.bankId = bankId;
//	}
//	
//	public Company(String companyName) {
//		super();
//		
//		this.companyName = companyName;
//	}
//	
//	public Company(int companyId, String companyName, Blob logo, String uniformNumbers, String categories,
//			String account, String password, String email, String phone, Blob busRC, int bankId) {
//		super();
//		this.companyId = companyId;
//		this.companyName = companyName;
//		this.logo = logo;
//		this.uniformNumbers = uniformNumbers;
//		this.categories = categories;
//		this.account = account;
//		this.password = password;
//		this.email = email;
//		this.phone = phone;
//		this.busRC = busRC;
//		this.bankId = bankId;
//	}
//
//	public Company(String companyName, String uniformNumbers, String categories,
//			String account, String password, String email, String phone, int bankId) {
//		super();
//		
//		this.companyName = companyName;
//		
//		this.uniformNumbers = uniformNumbers;
//		this.categories = categories;
//		this.account = account;
//		this.password = password;
//		this.email = email;
//		this.phone = phone;
//		
//		this.bankId = bankId;
//	}
//	//驗證帳密
//	public Company(	 String password,String account) {
//		super();
//		this.account = account;
//		this.password = password;
//	}
////	public CompanyJavabean(String companyName, Blob logo, String uniformNumbers, String categories,
////			String account, String password, String email, String phone, Blob busRC, int bankId) {
////		super();
////		
////		this.companyName = companyName;
////		this.logo = logo;
////		this.uniformNumbers = uniformNumbers;
////		this.categories = categories;
////		this.account = account;
////		this.password = password;
////		this.email = email;
////		this.phone = phone;
////		this.busRC = busRC;
////		this.bankId = bankId;
////	}
	//以上可以先註解
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public Blob getLogo() {
		return logo;
	}
	public void setLogo(Blob logo) {
		this.logo = logo;
	}
	public String getUniformNumbers() {
		return uniformNumbers;
	}
	public void setUniformNumbers(String uniformNumbers) {
		this.uniformNumbers = uniformNumbers;
	}
	public String getCategories() {
		return categories;
	}
	public void setCategories(String categories) {
		this.categories = categories;
	}
	public String getAccount() {
		return Account;
	}
	public void setAccount(String account) {
		Account = account;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Blob getBusRC() {
		return busRC;
	}
	public void setBusRC(Blob busRC) {
		this.busRC = busRC;
	}
	public int getBankId() {
		return bankId;
	}
	public void setBankId(int bankId) {
		this.bankId = bankId;
	}
	public String getProfile() {
		return Profile;
	}
	public void setProfile(String profile) {
		Profile = profile;
	}
	public boolean isStatus() {
		return Status;
	}
	public void setStatus(boolean status) {
		Status = status;
	}
	public Set<Event> getEvents() {
		return events;
	}
	public void setEvents(Set<Event> events) {
		this.events = events;
	}
	
	
}
