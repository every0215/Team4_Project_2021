package com.web.store.product.model;

import java.io.Serializable;
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
@Table(name = "Product")
public class Product implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name= "ProductId")
	private Integer productId;
	@Column(name= "ProductName")
	private String productName;
	@Column(name= "ProductType")
	private String productType;
	@Column(name= "ProductDescript")
	private String productDescript;
	@Column(name= "CompanyName")
	private String companyName;
	@Column(name= "productStuck")
	private Integer productStuck;
	@Column(name= "ProductPrice")
	private Integer productPrice;
	@Column(name= "Discount")
	private Integer discount;
	@Column(name= "ProductPic")
	private Blob productPic;
	@Column(name= "PicName")
	private String picName;
	@Column(name= "Status")
	private Integer status;
	@Transient
	MultipartFile eMultipartFile;
	public  Product(){
		
	}
	public  Product(Integer productId,String productName,String productType,String productDescript,
			String companyName,Integer productStuck,Integer productPrice,Integer discount,Blob productPic
			,Integer status){
		super();
		this.productId = productId;
		this.productName =productName;
		this.productType = productType;
		this.productDescript = productDescript;
		this.productStuck= productStuck;
		this.productPrice =productPrice;
		this.discount=discount; 
		this.productPic=productPic; 
		this.companyName=companyName;
		this.status=status;
	}
	public  Product(String productName,String productType,String productDescript,
			String companyName,Integer productStuck,Integer productPrice,Integer discount,Blob productPic,Integer status
			){
		super();
		this.productName =productName;
		this.productType = productType;
		this.productDescript = productDescript;
		this.productStuck= productStuck;
		this.productPrice =productPrice;
		this.discount=discount; 
		this.productPic=productPic; 
		this.companyName=companyName;
		this.status=status;
	}
	
	
	public Product(Blob productPic, String picName, String productName, String productType, String productDescript,
			String companyName, Integer productStuck, Integer productPrice, Integer discount, Integer status) {		
		super();
		this.productPic=productPic;
		this.picName=picName;
		this.productName =productName;
		this.productType = productType;
		this.productDescript = productDescript;
		this.productStuck= productStuck;
		this.productPrice =productPrice;
		this.discount=discount; 
		this.companyName=companyName;
		this.status=status;
	}
	public Integer getproductId() {
		return productId;
	}
	public void setproductId(Integer productId) {
		this.productId = productId;
	}
	public String getproductName() {
		return productName;
	}
	public void setproductName(String productName) {
		this.productName = productName;
	}
	public String getproductType() {
		return productType;
	}
	public void setproductType(String productType) {
		this.productType = productType;
	}
	public String getproductDescript() {
		return productDescript;
	}
	public void setproductDescript(String productDescript) {
		this.productDescript = productDescript;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public Integer getproductStuck() {
		return productStuck;
	}
	public void setproductStuck(Integer productStuck) {
		this.productStuck = productStuck;
	}
	public Integer getproductPrice() {
		return productPrice;
	}
	public void setproductPrice(Integer productPrice) {
		this.productPrice = productPrice;
	}
	
	public Integer getdiscount() {
		return discount;
	}
	public void setdiscount(Integer discount) {
		this.discount = discount;
	}
	public Blob getproductPic() {
		return productPic;
	}
	public void setproductPic(Blob productPic) {
		this.productPic = productPic;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public MultipartFile geteMultipartFile() {
		return eMultipartFile;
	}
	public void seteMultipartFile(MultipartFile eMultipartFile) {
		this.eMultipartFile = eMultipartFile;
	}
	public String getPicName() {
		return picName;
	}
	public void setPicName(String picName) {
		this.picName = picName;
	}
}
