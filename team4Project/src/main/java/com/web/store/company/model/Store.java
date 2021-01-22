package com.web.store.company.model;

import java.sql.Blob;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

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
		private Date openhour;
		@Column(name= "Closehour")
		private Date closehour;
		//寫company的關聯
		@Transient
		@Column(name= "CompanyId")
		private Integer companyId;
	
		@Column(name= "Profiles")
		private String profiles;
		@Column(name= "Status")
		private Boolean status=true;
		
		public Store() {
			
		}
		
		public Store(Integer id,Boolean status) {
			super();
			this.id = id;
			this.status = status;
		}
		
		public Store(Integer id, String storeName, String storeArea, String storeAddress, String phone, String fex,
				Boolean businessHour, Date openhour, Date closehour, Integer companyId, String profiles,
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
			this.companyId = companyId;
			this.profiles = profiles;
			this.status = status;
		}
		
		
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
		public Date getOpenhour() {
			return openhour;
		}
		public void setOpenhour(Date openhour) {
			this.openhour = openhour;
		}
		public Date getClosehour() {
			return closehour;
		}
		public void setClosehour(Date closehour) {
			this.closehour = closehour;
		}
		public Integer getCompanyId() {
			return companyId;
		}
		public void setCompanyId(Integer companyId) {
			this.companyId = companyId;
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
}
