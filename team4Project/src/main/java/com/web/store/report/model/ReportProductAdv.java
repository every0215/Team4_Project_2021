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
	
	private int companyid;
	
	private int productid;
	
	private String productName;
	
	private String productDescript;
	
	
	public ReportProductAdv() {
	}
	
	
	public ReportProductAdv(int id,int companyid,int productid,String productName,String productDescript) {
		this.id=id;
		this.companyid=companyid;
		this.productid=productid;
		this.productName=productName;
		this.productDescript=productDescript;
	}
	
	public ReportProductAdv(int companyid,int productid,String productName,String productDescript) {
		this.companyid=companyid;
		this.productid=productid;
		this.productName=productName;
		this.productDescript=productDescript;
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}



	public int getCompanyid() {
		return companyid;
	}



	public void setCompanyid(int companyid) {
		this.companyid = companyid;
	}



	public int getProductid() {
		return productid;
	}



	public void setProductid(int productid) {
		this.productid = productid;
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



	private int productPrice;
	private Blob productPic;
	
	


}
