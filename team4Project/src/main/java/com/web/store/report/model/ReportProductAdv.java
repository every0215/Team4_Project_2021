package com.web.store.report.model;

import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ReportProductAdv")
public class ReportProductAdv {

	@Id
	@Column(name="Id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private int orderAsc;
	
	private int companyid;
	
	private int productId;
	
	private String productName;
	
	private String productDescript;
	
	private int productPrice;
	
	private Blob productPic;
	
	
	public ReportProductAdv() {
	}
	
	
	public ReportProductAdv(int id,int orderasc,int companyid,int productid,String productName,String productDescript,int productPrice,Blob productPic) {
		this.id=id;
		this.orderAsc=orderasc;
		this.companyid=companyid;
		this.productId=productid;
		this.productName=productName;
		this.productDescript=productDescript;
		this.productPrice=productPrice;
		this.productPic=productPic;
	}
	
	public ReportProductAdv(int orderasc,int companyid,int productid,String productName,String productDescript,int productPrice,Blob productPic) {
		this.orderAsc=orderasc;
		this.companyid=companyid;
		this.productId=productid;
		this.productName=productName;
		this.productDescript=productDescript;
		this.productPrice=productPrice;
		this.productPic=productPic;
	}
	
	public ReportProductAdv(int orderasc,int companyid,int productid,String productName,String productDescript,int productPrice) {
		this.orderAsc=orderasc;
		this.companyid=companyid;
		this.productId=productid;
		this.productName=productName;
		this.productDescript=productDescript;
		this.productPrice=productPrice;
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}


	public int getOrderAsc() {
		return orderAsc;
	}


	public void setOrderAsc(int orderAsc) {
		this.orderAsc = orderAsc;
	}


	public int getCompanyId() {
		return companyid;
	}


	public void setCompanyId(int companyId) {
		this.companyid = companyId;
	}


	public int getProductId() {
		return productId;
	}


	public void setProductId(int productId) {
		this.productId = productId;
	}


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public String getProductDescript() {
		return productDescript;
	}


	public void setProductDescript(String productDescript) {
		this.productDescript = productDescript;
	}


	public int getProductPrice() {
		return productPrice;
	}


	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}


	public Blob getProductPic() {
		return productPic;
	}


	public void setProductPic(Blob productPic) {
		this.productPic = productPic;
	}

	
}
