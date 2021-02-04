package com.web.store.company.model;

import java.sql.Blob;
import java.sql.Time;
import java.util.HashSet;
import java.util.List;
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
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.web.store.product.model.Product;

@Entity
@Table(name="Store")
public class Store {
	
	
		
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		@Column(name= "Id")
		private Integer id;
		@Column(name= "StoreName")
		private String storeName;
		@Column(name= "StoreArea")
		private String storeArea;
		@Column(name= "StoreAddress")
		private String storeAddress;
		@Column(name= "Phone")
		private String phone;
		@Column(name= "Fex")
		private String fex;
		@Column(name= "BusinessHour")
		private Boolean businessHour;//true是24hr false是要填時間
		@Column(name= "Openhour")
		private String openhour;
		@Column(name= "Closehour")
		private String closehour;
		//get的時候會用到

//		@Transient
		@JoinColumn(name = "CompanyId")
		@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
		@JsonIgnore
		private Company company;
		
	
		@Column(name= "Profiles")
		private String profiles;
		@Column(name= "Status")
		private Boolean status=true;
		
//		@Transient
		@JsonIgnore
		@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
		@JoinTable(name = "StoreService", joinColumns = {
	            @JoinColumn(name = "StoreId") }, inverseJoinColumns = {
	                    @JoinColumn(name = "ServiceId") })
		private Set<CmpService> cmpServiceS=new HashSet<CmpService>();
		
		@Column(name= "Lat")
		private Double lat;
		
		@Column(name= "Lng")
		private Double lng;
	/////////////////////////////////////////////////	
		@Transient
		private List<Integer> svid;
		
		
		
		
		public Store() {
			
		}
		public Store(Double lat,Double lng) {
			
		}
		
		public Store(Integer id,Boolean status) {
			super();
			this.id = id;
			this.status = status;
		}
		
		public Store(Integer id, String profiles) {
			super();
			this.id = id;
			this.profiles = profiles;
			
		}
		
		public Store(String storeName, String storeArea, String storeAddress, String phone, String fex,
				Boolean businessHour, String openhour, String closehour, Company company, String profiles,
				Boolean status) {
			super();
			
			this.storeName = storeName;
			this.storeArea = storeArea;
			this.storeAddress = storeAddress;
			this.phone = phone;
			this.fex = fex;
			this.businessHour = businessHour;
			this.openhour = openhour;
			this.closehour = closehour;
			this.company = company;
			this.profiles = profiles;
			this.status = status;
		}
		public Store(Integer id, String storeName, String storeArea, String storeAddress, String phone, String fex,
				Boolean businessHour, String openhour, String closehour, Company company, String profiles,
				Boolean status) {
			super();
			this.id = id;
			this.storeName = storeName;
			this.storeArea = storeArea;
			this.storeAddress = storeAddress;
			this.phone = phone;
			this.fex = fex;
			this.businessHour = businessHour;
			this.openhour = openhour;
			this.closehour = closehour;
			this.company = company;
			this.profiles = profiles;
			this.status = status;
		}
		
		
//用companyId的方法		
//		public Store(String storeName, String storeArea, String storeAddress, String phone, String fex,
//				Boolean businessHour, String openhour, String closehour, Integer companyId, String profiles,
//				Boolean status) {
//			super();
//			
//			this.storeName = storeName;
//			this.storeArea = storeArea;
//			this.storeAddress = storeAddress;
//			this.phone = phone;
//			this.fex = fex;
//			this.businessHour = businessHour;
//			this.openhour = openhour;
//			this.closehour = closehour;
//			this.companyId = companyId;
//			this.profiles = profiles;
//			this.status = status;
//		}
//		public Store(Integer id, String storeName, String storeArea, String storeAddress, String phone, String fex,
//				Boolean businessHour, String openhour, String closehour, Integer companyId, String profiles,
//				Boolean status) {
//			super();
//			this.id = id;
//			this.storeName = storeName;
//			this.storeArea = storeArea;
//			this.storeAddress = storeAddress;
//			this.phone = phone;
//			this.fex = fex;
//			this.businessHour = businessHour;
//			this.openhour = openhour;
//			this.closehour = closehour;
//			this.companyId = companyId;
//			this.profiles = profiles;
//			this.status = status;
//		}
		
		
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		public String getStoreName() {
			return storeName;
		}
		public void setStoreName(String storeName) {
			this.storeName = storeName;
		}
		public String getStoreArea() {
			return storeArea;
		}
		public void setStoreArea(String storeArea) {
			this.storeArea = storeArea;
		}
		public String getStoreAddress() {
			return storeAddress;
		}
		public void setStoreAddress(String storeAddress) {
			this.storeAddress = storeAddress;
		}
		public String getPhone() {
			return phone;
		}
		public void setPhone(String phone) {
			this.phone = phone;
		}
		public String getFex() {
			return fex;
		}
		public void setFex(String fex) {
			this.fex = fex;
		}
		public Boolean getBusinessHour() {
			return businessHour;
		}
		public void setBusinessHour(Boolean businessHour) {
			this.businessHour = businessHour;
		}
		public String getOpenhour() {
			return openhour;
		}
		public void setOpenhour(String openhour) {
			this.openhour = openhour;
		}
		public String getClosehour() {
			return closehour;
		}
		public void setClosehour(String closehour) {
			this.closehour = closehour;
		}
//		public Integer getCompanyId() {
//			return companyId;
//		}
//		public void setCompanyId(Integer companyId) {
//			this.companyId = companyId;
//		}

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

		public Company getCompany() {
			return company;
		}

		public void setCompany(Company company) {
			this.company = company;
		}

		public Set<CmpService> getCmpServiceS() {
			return cmpServiceS;
		}

		public void setCmpServiceS(Set<CmpService> cmpServiceS) {
			this.cmpServiceS = cmpServiceS;
		}

		public Double getLat() {
			return lat;
		}

		public void setLat(Double lat) {
			this.lat = lat;
		}

		public Double getLng() {
			return lng;
		}

		public void setLng(Double lng) {
			this.lng = lng;
		}
		public List<Integer> getSvid() {
			return svid;
		}
		public void setSvid(List<Integer> svid) {
			this.svid = svid;
		}
}
