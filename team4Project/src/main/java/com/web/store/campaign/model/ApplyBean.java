package com.web.store.campaign.model;

import java.util.List;

import com.web.store.product.model.Product;

public class ApplyBean {

	private List<Integer> productsIdInCamp;
	private List<Integer> productsIdNotInCamp;
	public List<Integer> getProductsIdInCamp() {
		return productsIdInCamp;
	}
	public void setProductsIdInCamp(List<Integer> productsIdInCamp) {
		this.productsIdInCamp = productsIdInCamp;
	}
	public List<Integer> getProductsIdNotInCamp() {
		return productsIdNotInCamp;
	}
	public void setProductsIdNotInCamp(List<Integer> productsIdNotInCamp) {
		this.productsIdNotInCamp = productsIdNotInCamp;
	}

	

}
