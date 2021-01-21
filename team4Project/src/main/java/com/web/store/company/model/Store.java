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
		private int id;
		@Column(name= "Store")
		private String store;
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
		//寫bank關聯
		@Transient
		@Column(name= "BankId")
		private Integer bankId;
		
		
		@Column(name= "Profiles")
		private String Profiles;
		@Column(name= "Status")
		private Boolean Status=true;
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getStore() {
			return store;
		}
		public void setStore(String store) {
			this.store = store;
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
		public Integer getBankId() {
			return bankId;
		}
		public void setBankId(Integer bankId) {
			this.bankId = bankId;
		}
		public String getProfiles() {
			return Profiles;
		}
		public void setProfiles(String profiles) {
			Profiles = profiles;
		}
		public Boolean getStatus() {
			return Status;
		}
		public void setStatus(Boolean status) {
			Status = status;
		}
}
