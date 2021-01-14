package com.web.store.product.controller;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "product")
public class ProductBean implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int productId;
	private String productName;
	private String productType;
	private String productDescript;

	private int productstuck;
	private int productPrice;
	private int storeID;
	private int discount;
	private Blob productPic;
	public  ProductBean(){
		
	}
	public  ProductBean(int productId,String productName,String productType,String productDescript,
			int productstuck,int productPrice,int storeID,int discount,Blob productPic
			){
		this.productId = productId;
		this.productName =productName;
		this.productType = productType;
		this.productDescript = productDescript;
		this.productstuck= productstuck;
		this.productPrice =productPrice;
		this.storeID=storeID;
		this.discount=discount; 
		this.productPic=productPic; 
	
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
	public int getproductstuck() {
		return productstuck;
	}
	public void setproductstuck(int productstuck) {
		this.productstuck = productstuck;
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
