package com.web.store.company.model;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.HashSet;
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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.commons.codec.binary.Base64;
import org.hibernate.annotations.GeneratorType;
import org.springframework.web.multipart.MultipartFile;

import com.web.store.ticket.model.Event;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.web.store.campaign.model.Campaign;


@Entity
@Table(name="Company")
public class Company  {
//	implements Serializable
//	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name= "Id")
	private Integer id;
	@Column(name= "CompanyName")
	private String companyName;
	
	
	@Column(name= "Logo")
	@JsonIgnore
	private Blob logo;
	
	@Transient
	private String logoBase64;
	
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
	@JsonIgnore
	private Blob busRC;
	
	@Column(name = "busRCName")
	 private String busRCName;

	@Column(name= "Profiles")
	private String profiles;
	@Column(name= "Status")
	private Boolean status =true;//企業的上下架狀態，只有1或0
	
	
	@JsonIgnore
	@OneToMany(fetch=FetchType.LAZY,cascade = CascadeType.ALL,mappedBy = "company")
	private Set<Campaign> campaigns;
	@JsonIgnore
	@Transient
	@OneToMany(fetch=FetchType.EAGER, mappedBy="company", cascade=CascadeType.ALL)
	 private Set<Event> events = new LinkedHashSet<Event>();
	
	@JsonIgnore
	@OneToMany(fetch=FetchType.LAZY,cascade = CascadeType.ALL,mappedBy = "company")
	private Set<Store> stores;
	
//	@Transient
	@JsonIgnore
	@OneToMany(fetch=FetchType.LAZY,cascade = CascadeType.ALL,mappedBy = "company")
	private Set<CmpService> cmpServiceC;
	
//	
//	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
//	@JoinTable(name = "CompanyService", joinColumns = {
//            @JoinColumn(name = "CompanyId", referencedColumnName = "Id") }, inverseJoinColumns = {
//                    @JoinColumn(name = "ServiceId", referencedColumnName = "Id") })	
//	private Set<CmpService> cmpService = new HashSet<CmpService>();;
	
	
	
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

	public String getLogoBase64() throws SQLException, UnsupportedEncodingException {
		if(this.logo != null && this.logoBase64 == null) {
			byte[] encodeBase64 = Base64.encodeBase64(this.logo.getBytes(1, (int) this.logo.length()));
			this.logoBase64 = new String(encodeBase64, "UTF-8");
		}
		return logoBase64;
	}

	public void setLogoBase64(String logoBase64)  {
		this.logoBase64 = logoBase64;
	}

	public Set<Store> getStores() {
		return stores;
	}

	public void setStores(Set<Store> stores) {
		this.stores = stores;
	}

	public Set<CmpService> getCmpServiceC() {
		return cmpServiceC;
	}

	public void setCmpServiceC(Set<CmpService> cmpServiceC) {
		this.cmpServiceC = cmpServiceC;
	}
	
	
	
}
