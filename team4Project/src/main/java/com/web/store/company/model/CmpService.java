package com.web.store.company.model;

import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="Service")
public class CmpService {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name= "Id")
	private Integer id;
	@Column(name= "SpService")
	private String spService;
	@Column(name= "SpServiceImg")
	private Blob spServiceImg;
	@Column(name= "SVFilename")
	private String svFilename;
	@Transient
	 MultipartFile sMultipartFile;
	
	//manytomany
	//store company
	
	public CmpService() {
		
	}
	
	
	public CmpService(Integer id, String spService, Blob spServiceImg, String svFilename) {
		super();
		this.id = id;
		this.spService = spService;
		this.spServiceImg = spServiceImg;
		this.svFilename = svFilename;
		
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSpService() {
		return spService;
	}
	public void setSpService(String spService) {
		this.spService = spService;
	}
	public Blob getSpServiceImg() {
		return spServiceImg;
	}
	public void setSpServiceImg(Blob spServiceImg) {
		this.spServiceImg = spServiceImg;
	}
	public String getSvFilename() {
		return svFilename;
	}
	public void setSvFilename(String svFilename) {
		this.svFilename = svFilename;
	}
	public MultipartFile getsMultipartFile() {
		return sMultipartFile;
	}
	public void setsMultipartFile(MultipartFile sMultipartFile) {
		this.sMultipartFile = sMultipartFile;
	}
}
