package com.web.store.company.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="StoreService")
public class StoreService {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name= "Id")
	Integer id;
	@Column(name= "StoreId")
	Integer StoreId;
	@Column(name= "ServiceId")
	Integer ServiceId;
	
	}

