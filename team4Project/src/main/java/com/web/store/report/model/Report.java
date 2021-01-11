package com.web.store.report.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Report")
public class Report {

	@Id
	@Column(name = "reportid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int reportid;
	private String companyid;
	private int storeid;
	private String storearea;
	private String storename;
	private String productclass;
	private int Productid;
	private String productname;
	private String salesdate;
	private int productprice;
	private int productdiscountprice;
	private int salesamount;
	private int stockamount;
	private String payment;
	private String activeitem;
	private String productstatus;

	public Report() {
		// TODO Auto-generated constructor stub
	}

	public int getReportid() {
		return reportid;
	}

	public void setReportid(int reportid) {
		this.reportid = reportid;
	}

	public String getCompanyid() {
		return companyid;
	}

	public void setCompanyid(String companyid) {
		this.companyid = companyid;
	}

	public int getStoreid() {
		return storeid;
	}

	public void setStoreid(int storeid) {
		this.storeid = storeid;
	}

	public String getStorearea() {
		return storearea;
	}

	public void setStorearea(String storearea) {
		this.storearea = storearea;
	}

	public String getStorename() {
		return storename;
	}

	public void setStorename(String storename) {
		this.storename = storename;
	}

	public String getProductclass() {
		return productclass;
	}

	public void setProductclass(String productclass) {
		this.productclass = productclass;
	}

	public int getProductid() {
		return Productid;
	}

	public void setProductid(int productid) {
		Productid = productid;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getSalesdate() {
		return salesdate;
	}

	public void setSalesdate(String salesdate) {
		this.salesdate = salesdate;
	}

	public int getProductprice() {
		return productprice;
	}

	public void setProductprice(int productprice) {
		this.productprice = productprice;
	}

	public int getProductdiscountprice() {
		return productdiscountprice;
	}

	public void setProductdiscountprice(int productdiscountprice) {
		this.productdiscountprice = productdiscountprice;
	}

	public int getSalesamount() {
		return salesamount;
	}

	public void setSalesamount(int salesamount) {
		this.salesamount = salesamount;
	}

	public int getStockamount() {
		return stockamount;
	}

	public void setStockamount(int stockamount) {
		this.stockamount = stockamount;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getActiveitem() {
		return activeitem;
	}

	public void setActiveitem(String activeitem) {
		this.activeitem = activeitem;
	}

	public String getProductstatus() {
		return productstatus;
	}

	public void setProductstatus(String productstatus) {
		this.productstatus = productstatus;
	}

}
