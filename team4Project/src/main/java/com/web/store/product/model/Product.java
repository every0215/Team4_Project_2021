package com.web.store.product.model;

import java.io.Serializable;
import java.sql.Blob;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.web.store.campaign.model.Campaign;


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
	private Integer discount=1;
	@Column(name= "ProductPic")
	private Blob productPic;
	@Column(name= "PicName")
	private String picName;
	@Column(name= "Status")
	private Integer status;
	@Transient
	MultipartFile eMultipartFile;
	@JsonIgnore
	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinTable(name = "Campaign_product", joinColumns = {
            @JoinColumn(name = "product_id", referencedColumnName = "productId") }, inverseJoinColumns = {
                    @JoinColumn(name = "campaign_id", referencedColumnName = "id") })
	Set<Campaign> campaigns=new HashSet<Campaign>();
	
	
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
	public  Product(){
		
	}
	

	public Product(Blob productPic, String picName, String productName, String productType, String productDescript,
			String companyName, Integer productStuck, Integer productPrice, Integer status) {
		// TODO Auto-generated constructor stub
		super();
		this.productPic=productPic;
		this.picName=picName;
		this.productName =productName;
		this.productType = productType;
		this.productDescript = productDescript;
		this.productStuck= productStuck;
		this.productPrice =productPrice;
		this.companyName=companyName;
		this.status=status;
	}
	
	public Product(Integer productId,Blob productPic, String picName, String productName, String productType, String productDescript,
			String companyName, Integer productStuck, Integer productPrice, Integer status) {
		// TODO Auto-generated constructor stub
		super();
		this.productId=productId;
		this.productPic=productPic;
		this.picName=picName;
		this.productName =productName;
		this.productType = productType;
		this.productDescript = productDescript;
		this.productStuck= productStuck;
		this.productPrice =productPrice;
		this.companyName=companyName;
		this.status=status;
	}
	public Integer getproductId() {
		return productId;
	}
	public void setproductId(Integer productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setproductName(String productName) {
		this.productName = productName;
	}
	public String getProductType() {
		return productType;
	}
	public void setproductType(String productType) {
		this.productType = productType;
	}
	public String getProductDescript() {
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
	public Integer getProductStuck() {
		return productStuck;
	}
	public void setproductStuck(Integer productStuck) {
		this.productStuck = productStuck;
	}
	public Integer getProductPrice() {
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
	public Blob getProductPic() {
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
	public Set<Campaign> getCampaigns() {
		return campaigns;
	}
	public void setCampaigns(Set<Campaign> campaigns) {
		this.campaigns = campaigns;
	}
	
	
}
