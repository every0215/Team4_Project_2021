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
import org.springframework.web.multipart.MultipartFile;

import com.web.store.ticket.model.Event;
import com.web.store.campaign.model.Campaign;


@Entity
@Table(name="Company")
public class Company {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name= "Id")
	private Integer id;
	@Column(name= "CompanyName")
	private String companyName;
	
	
	@Column(name= "Logo")
	private Blob logo;
	
	@Column(name = "logoName")
	 private String logoName;

	 @Transient
	 MultipartFile eMultipartFile;
	 
	 
	@Column(name= "UniformNumbers")
	private String uniformNumbers;
	@Column(name= "Categories")
	private Integer categories;
	@Column(name= "Account")
	private String account;
	@Column(name= "Password")
	private String password;
	@Column(name= "Email")
	private String email;
	@Column(name= "Phone")
	private String phone;
	@Column(name= "BusRC")
	private Blob busRC;
	
	@Column(name = "busRCName")
	 private String busRCName;

	@Column(name= "Profiles")
	private String profiles;
	@Column(name= "Status")
	private Boolean status =true;//企業的上下架狀態，只有1或0
	
	@OneToMany(fetch=FetchType.LAZY,cascade = CascadeType.ALL,mappedBy = "company")
	private Set<Campaign> campaigns;
	
	@Transient
	@OneToMany(fetch=FetchType.LAZY, mappedBy="COMPANY", cascade=CascadeType.ALL)
	 private Set<Event> events = new LinkedHashSet<Event>();
	
	public Company() {
		
	}
	
	public Company( Integer id,String companyName, Blob logo, String logoName, String uniformNumbers, Integer categories,
			String account, String password, String email, String phone, Blob busRC, String busRCName
			) {
		super();
		this.id = id;
		this.companyName = companyName;
		this.logo = logo;
		this.logoName = logoName;
		this.uniformNumbers = uniformNumbers;
		this.categories = categories;
		this.account = account;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.busRC = busRC;
		this.busRCName = busRCName;
		
	}
	public Company( String companyName, Blob logo, String logoName, String uniformNumbers, Integer categories,
			String account, String password, String email, String phone, Blob busRC, String busRCName
			) {
		super();
		
		this.companyName = companyName;
		this.logo = logo;
		this.logoName = logoName;
		this.uniformNumbers = uniformNumbers;
		this.categories = categories;
		this.account = account;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.busRC = busRC;
		this.busRCName = busRCName;
	
	}
	public Company( String companyName, Blob logo, String logoName, String uniformNumbers, Integer categories,
			String account, String password, String email, String phone, Blob busRC, String busRCName, String profiles,
			Boolean status) {
		super();
		
		this.companyName = companyName;
		this.logo = logo;
		this.logoName = logoName;
		this.uniformNumbers = uniformNumbers;
		this.categories = categories;
		this.account = account;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.busRC = busRC;
		this.busRCName = busRCName;
		this.profiles = profiles;
		this.status = status;
	}
	public Company(Integer id, String companyName, Blob logo, String logoName, String uniformNumbers, Integer categories,
			String account, String password, String email, String phone, Blob busRC, String busRCName, String profiles,
			Boolean status) {
		super();
		this.id = id;
		this.companyName = companyName;
		this.logo = logo;
		this.logoName = logoName;
		this.uniformNumbers = uniformNumbers;
		this.categories = categories;
		this.account = account;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.busRC = busRC;
		this.busRCName = busRCName;
		this.profiles = profiles;
		this.status = status;
	}
	public Company(	String account, String password) {
		super();
		
		this.account = account;
		this.password = password;
		
	}

	public int getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
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
	public Integer getCategories() {
		return categories;
	}
	public void setCategories(Integer categories) {
		this.categories = categories;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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

	public String getProfiles() {
		return profiles;
	}
	public void setProfiles(String profiles) {
		this.profiles = profiles;
	}
	public Boolean getStatus() {
		return status;
	}
	public void setStatus(Boolean status) {
		this.status = status;
	}
	public Set<Event> getEvents() {
		return events;
	}
	public void setEvents(Set<Event> events) {
		this.events = events;
	}
	public String getLogoName() {
		return logoName;
	}
	public void setLogoName(String logoName) {
		this.logoName = logoName;
	}
	public MultipartFile geteMultipartFile() {
		return eMultipartFile;
	}
	public void seteMultipartFile(MultipartFile eMultipartFile) {
		this.eMultipartFile = eMultipartFile;
	}
	public String getBusRCName() {
		return busRCName;
	}
	public void setBusRCName(String busRCName) {
		this.busRCName = busRCName;
	}

	public Set<Campaign> getCampaigns() {
		return campaigns;
	}

	public void setCampaigns(Set<Campaign> campaigns) {
		this.campaigns = campaigns;
	}
	
}
