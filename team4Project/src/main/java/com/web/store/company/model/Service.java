package com.web.store.company.model;

import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="service")
public class Service {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name= "Id")
	private int Id;
	@Column(name= "SpService")
	private String SpService;
	@Column(name= "SpServiceImg")
	private Blob SpServiceImg;
}
