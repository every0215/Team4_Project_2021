package com.web.store.product.model;


import java.util.LinkedHashMap;

import java.util.Map;






public class Cart  {
	
	private Map<Integer, ProductOrderDetail> cart = new LinkedHashMap< >();
	public Cart() {
	}
	public Map<Integer, ProductOrderDetail>  getContent() { // ${ShoppingCart.content}
		return cart;
	}
	public void addToCart(int productId, ProductOrderDetail  oib) {
		if (oib.getQuanity() <= 0 ) {
			return;
		}
		// 如果客戶在伺服器端沒有此項商品的資料，則客戶第一次購買此項商品
		if ( cart.get(productId) == null ) {
		    cart.put(productId, oib);
		} else {
	        // 如果客戶在伺服器端已有此項商品的資料，則客戶『加購』此項商品
			ProductOrderDetail oiBean = cart.get(productId);
			oiBean.setQuanity(oib.getQuanity() + oiBean.getQuanity());
		}
	}

}
