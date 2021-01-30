package com.web.store.product.service;

import java.util.ArrayList;

import com.web.store.product.model.ProductOrder;

public interface ProductOrderService {

	ProductOrder addOrder(ProductOrder productOrder);

	ProductOrder alterOrder(ProductOrder productOrder);

	void delete(int id);

	ArrayList<ProductOrder> queryOrderByMemberId(Integer memberId);

}