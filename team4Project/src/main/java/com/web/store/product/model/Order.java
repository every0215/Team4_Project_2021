package com.web.store.product.model;

import java.io.Serializable;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

public class Order  implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name= "OrderId")
	private Integer orderId;
	@ManyToOne(fetch=FetchType.LAZY)
	@Column(name= "MemberId")
	private Integer memberId;
	@Column(name= "Amount")
	private Integer amount;
	@Column(name= "Count")
	private Integer count;
	@Column(name= "OrderNumber")
	private Integer orderNumber;
	
	public Order() {
		
	}
	
	public Order(Integer orderId, Integer memberId, Integer amount, Integer count, Integer orderNumber
			) {
		super();
		this.orderId = orderId;
		this.memberId = memberId;
		this.amount = amount;
		this.count = count;
		this.orderNumber = orderNumber;
		
	}
	public Order( Integer memberId, Integer amount, Integer count, Integer orderNumber
			) {
		super();
		this.memberId = memberId;
		this.amount = amount;
		this.count = count;
		this.orderNumber = orderNumber;
		
	}
	public Order(Integer orderId, Integer memberId, Integer amount, Integer count, Integer orderNumber,
			List<OrderDetail> orderdetail) {
		super();
		this.orderId = orderId;
		this.memberId = memberId;
		this.amount = amount;
		this.count = count;
		this.orderNumber = orderNumber;
		Orderdetail = orderdetail;
	}
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "Order", cascade = CascadeType.ALL)
	private List<OrderDetail> Orderdetail = new ArrayList<OrderDetail>();
	
	
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Integer getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(Integer orderNumber) {
		this.orderNumber = orderNumber;
	}
	
}
