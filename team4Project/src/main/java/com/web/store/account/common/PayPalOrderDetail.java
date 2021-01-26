/**
 * OrderDetail class - represents payment details.
 * @author Nam Ha Minh
 * @copyright https://codeJava.net
 */
package com.web.store.account.common;

public class PayPalOrderDetail {
	private String productName;
	private float subtotal;
	private float shipping;
	private float tax;
	private float total;

	public PayPalOrderDetail(String productName, String subtotal, 
			String shipping, String tax, String total) {
		this.productName = productName;
		this.subtotal = Float.parseFloat(subtotal);
		this.shipping = Float.parseFloat(shipping);
		this.tax = Float.parseFloat(tax);
		this.total = Float.parseFloat(total);
	}

	public String getProductName() {
		return productName;
	}

	public String getSubtotal() {
		return String.format("%.2f", subtotal/28);
	}

	public String getShipping() {
		return String.format("%.2f", shipping/28);
	}

	public String getTax() {
		return String.format("%.2f", tax/28);
	}
	
	public String getTotal() {
		return String.format("%.2f", total/28);
	}
}
