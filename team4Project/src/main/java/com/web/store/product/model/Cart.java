package com.web.store.product.model;

import java.io.Serializable;
import java.util.List;



public class Cart  implements Serializable{
	private static final long serialVersionUID = 1L;
	private List<Product> Products;
	private Product product;
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	private Integer total;
	private Integer number;
	private Integer price;
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public List<Product> getProducts(){
		return Products;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public void setProducts(List<Product> products) {
		this.Products = products;
	};
	
}
