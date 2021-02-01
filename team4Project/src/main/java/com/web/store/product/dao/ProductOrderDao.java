package com.web.store.product.dao;

import java.util.ArrayList;

import com.web.store.product.model.ProductOrder;

public interface ProductOrderDao {

	ProductOrder addOrder(ProductOrder productOrder);

	ProductOrder alterOrder(ProductOrder productOrder);

	void delete(int id);

	ArrayList<ProductOrder> queryOrderByMemberId(Integer memberId);

}