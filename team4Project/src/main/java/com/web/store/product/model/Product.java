package com.web.store.product.model;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "Product")
public class Product implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name= "ProductId")
	private int productId;
	@Column(name= "ProductName")
	private String productName;
	@Column(name= "ProductType")
	private String productType;
	@Column(name= "ProductDescript")
	private String productDescript;
	@Column(name= "CompanyName")
	private String companyName;
	@Column(name= "productStuck")
	private int productStuck;
	@Column(name= "ProductPrice")
	private int productPrice;
	@Column(name= "StoreID")
	private int storeID;
	@Column(name= "Discount")
	private int discount;
	@Column(name= "ProductPic")
	private Blob productPic;
	
	public  Product(){
		
	}
	public  Product(int productId,String productName,String productType,String productDescript,
			String companyName,int productStuck,int productPrice,int storeID,int discount,Blob productPic
			){
		this.productId = productId;
		this.productName =productName;
		this.productType = productType;
		this.productDescript = productDescript;
		this.productStuck= productStuck;
		this.productPrice =productPrice;
		this.storeID=storeID;
		this.discount=discount; 
		this.productPic=productPic; 
		this.companyName=companyName;
	}
	public  Product(String productName,String productType,String productDescript,
			String companyName,int productStuck,int productPrice,int storeID,int discount,Blob productPic
			){
		
		this.productName =productName;
		this.productType = productType;
		this.productDescript = productDescript;
		this.productStuck= productStuck;
		this.productPrice =productPrice;
		this.storeID=storeID;
		this.discount=discount; 
		this.productPic=productPic; 
		this.companyName=companyName;
	}
	public int getproductId() {
		return productId;
	}
	public void setproductId(int productId) {
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
	public int getproductStuck() {
		return productStuck;
	}
	public void setproductStuck(int productStuck) {
		this.productStuck = productStuck;
	}
	public int getproductPrice() {
		return productPrice;
	}
	public void setproductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getstoreID() {
		return storeID;
	}
	public void setstoreID(int storeID) {
		this.storeID = storeID;
	}
	public int getdiscount() {
		return discount;
	}
	public void setdiscount(int discount) {
		this.discount = discount;
	}
	public Blob getproductPic() {
		return productPic;
	}
	public void setproductPic(Blob productPic) {
		this.productPic = productPic;
	}
}
