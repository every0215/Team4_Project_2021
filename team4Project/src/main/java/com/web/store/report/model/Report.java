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
	private int productid;
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

	}

	//---------------------------------------------------建構子-----------------------------------------------
	// 全部
	public Report(int reportid,String companyid, int storeid, String storearea, String storename, String productclass, int productid,
			String productname, String salesdate, int productprice, int productdiscountprice, int salesamount,
			int stockamount, String payment, String activeitem, String productstatus) {
		this.reportid=reportid;
		this.companyid=companyid;
		this.storeid=storeid;
		this.storearea=storearea;
		this.storename=storename;
		this.productclass=productclass;
		this.productid=productid;
		this.productname=productname;
		this.salesdate=salesdate;
		this.productprice=productprice;
		this.productdiscountprice=productdiscountprice;
		this.salesamount=salesamount;
		this.stockamount=stockamount;
		this.payment=payment;
		this.activeitem=activeitem;
		this.productstatus=productstatus;	
	}
	
	//全部不含reportid
	public Report(String companyid, int storeid, String storearea, String storename, String productclass, int productid,
			String productname, String salesdate, int productprice, int productdiscountprice, int salesamount,
			int stockamount, String payment, String activeitem, String productstatus) {
		this.companyid=companyid;
		this.storeid=storeid;
		this.storearea=storearea;
		this.storename=storename;
		this.productclass=productclass;
		this.productid=productid;
		this.productname=productname;
		this.salesdate=salesdate;
		this.productprice=productprice;
		this.productdiscountprice=productdiscountprice;
		this.salesamount=salesamount;
		this.stockamount=stockamount;
		this.payment=payment;
		this.activeitem=activeitem;
		this.productstatus=productstatus;	
	}
	
	
	
//----------------------------------------get,set-------------------------------------------------------
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
		return productid;
	}

	public void setProductid(int productid) {
		this.productid = productid;
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
