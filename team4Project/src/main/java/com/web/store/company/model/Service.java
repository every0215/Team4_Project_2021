//package com.web.store.company.model;
//
//import java.sql.Blob;
//
//import javax.persistence.Column;
//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
//import javax.persistence.Table;
//
//@Entity
//@Table(name="Service")
//public class Service {
//
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	@Column(name= "Id")
//	private int id;
//	@Column(name= "SpService")
//	private String spService;
//	
//	
//	public int getId() {
//		return id;
//	}
//	public void setId(int id) {
//		this.id = id;
//	}
//	public String getSpService() {
//		return spService;
//	}
//	public void setSpService(String spService) {
//		this.spService = spService;
//	}
//	public Blob getSpServiceImg() {
//		return spServiceImg;
//	}
//	public void setSpServiceImg(Blob spServiceImg) {
//		this.spServiceImg = spServiceImg;
//	}
//	@Column(name= "SpServiceImg")
//	private Blob spServiceImg;
//}
