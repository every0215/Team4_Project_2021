package com.web.store.product.model;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Transient;

import com.web.store.ticket.model.Price;
import com.web.store.ticket.model.TicketOrder;

public class OrderDetail implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name= "OrderDetailId")
	private Integer orderDetailId;
	
	@Column(name= "Amount")
	private Integer amount;
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
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "OrderId")
	private Order Order;
	
	
	@Transient
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "Product", cascade = CascadeType.ALL)
	private Set<Product> Product = new LinkedHashSet<Product>();
}
