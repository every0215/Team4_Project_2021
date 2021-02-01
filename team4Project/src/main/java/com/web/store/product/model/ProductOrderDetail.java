package com.web.store.product.model;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.web.store.ticket.model.Price;

@Entity
@Table(name = "ProductOrderDetail")
public class ProductOrderDetail implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name= "OrderDetailId")
	private Integer orderDetailId;

	@Column(name= "Price")
	private Integer price;
	@Column(name= "Quanity")
	private Integer quanity;
	
//	@OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@Column(name= "OrderNumber")
	private Integer orderNumber;
	
//	@OneToMany(fetch=FetchType.LAZY, mappedBy="OrderDetail", cascade=CascadeType.ALL)
	@Column(name= "ProductId")
	private Integer productId;
	@Column(name= "Discount")
	private Double discount;
	public Double getDiscount() {
		return discount;
	}
	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	//	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "OrderId")
	private ProductOrder Order;
	
	
	public ProductOrderDetail( Integer price, Integer quanity, Integer orderNumber, Integer productId,
			Double discount) {
		super();
		
		this.price = price;
		this.quanity = quanity;
		this.orderNumber = orderNumber;
		this.productId = productId;
		this.discount = discount;
		
	}
	public ProductOrderDetail(Integer orderDetailId,  Integer price, Integer quanity,
			Integer orderNumber, Integer productId, Double discount) {
		super();
		this.orderDetailId = orderDetailId;
		this.price = price;
		this.quanity = quanity;
		this.orderNumber = orderNumber;
		this.productId = productId;
		this.discount = discount;
		
	}
	public ProductOrderDetail() {
		
	}
	public Integer getOrderDetailId() {
		return orderDetailId;
	}

	public void setOrderDetailId(Integer orderDetailId) {
		this.orderDetailId = orderDetailId;
	}

	

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getQuanity() {
		return quanity;
	}

	public void setQuanity(Integer quanity) {
		this.quanity = quanity;
	}

	public Integer getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(Integer orderNumber) {
		this.orderNumber = orderNumber;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public ProductOrder getOrder() {
		return Order;
	}

	public void setOrder(ProductOrder order) {
		Order = order;
	}
	
	
//	@Transient
//	@OneToMany(fetch = FetchType.LAZY, mappedBy = "Product", cascade = CascadeType.ALL)
//	private Set<Product> Product = new LinkedHashSet<Product>();
}
