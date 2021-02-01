package com.web.store.product.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;


import com.web.store.product.dao.ProductOrderDao;
import com.web.store.product.model.ProductOrder;
import com.web.store.product.service.ProductOrderService;

public class ProductOrderServiceimpl implements ProductOrderService {
	@Autowired
	ProductOrderDao productOrderDao;
	
	@Override
	public ProductOrder addOrder(ProductOrder productOrder) {
		return productOrderDao.addOrder(productOrder);
	}

	@Override
	public ProductOrder alterOrder(ProductOrder productOrder) {
		return productOrderDao.alterOrder(productOrder);
	}

	@Override
	public void delete(int id) {
		 productOrderDao.delete(id);
	}

	@Override
	public ArrayList<ProductOrder> queryOrderByMemberId(Integer memberId) {
		return productOrderDao.queryOrderByMemberId(memberId);
	}
}
