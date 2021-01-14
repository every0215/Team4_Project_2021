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
@Table(name="store")
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
		private boolean businessHour;//true是24hr false是要填時間
		@Column(name= "Openhour")
		private Date openhour;
		@Column(name= "Closehour")
		private Date closehour;
		//寫company的關聯
		@Transient
		@Column(name= "CompanyId")
		private int companyId;
		//寫bank關聯
		@Transient
		@Column(name= "BankId")
		private int bankId;
		
		
		@Column(name= "Profiles")
		private String Profiles;
		@Column(name= "Status")
		private boolean Status=true;
}
