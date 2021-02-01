package com.web.store.product.model;


import java.util.LinkedHashMap;

import java.util.Map;
import java.util.Set;







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
	public boolean modifyQty(int productId, int newQty) {
		if ( cart.get(productId) != null ) {
			ProductOrderDetail  bean = cart.get(productId);
		   bean.setQuanity(newQty);
	       return true;
		} else {
		   return false;
		}
	}
	// 刪除某項商品
	public int deleteProduct(int productId) {
		if ( cart.get(productId) != null ) {
	       cart.remove(productId);  // Map介面的remove()方法
	       return 1;
		} else {
		   return 0;
		}
	}
	public int getItemNumber(){   // ShoppingCart.itemNumber
		return cart.size();
	}
	//計算購物車內所有商品的合計金額(每項商品的單價*數量的總和)
	public double getSubtotal(){
		double subTotal = 0 ;
		Set<Integer> set = cart.keySet();
		for(int n : set){
			ProductOrderDetail oib = cart.get(n);
			double price    = oib.getPrice();
			double discount = oib.getDiscount();
			int qty      = oib.getQuanity();
			subTotal +=  price * discount * qty;
		}
		return subTotal;
	}

}
