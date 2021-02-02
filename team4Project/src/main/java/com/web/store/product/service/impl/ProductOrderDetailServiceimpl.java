package com.web.store.product.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.web.store.product.dao.ProductOrderDao;
import com.web.store.product.dao.ProductOrderDetailDao;
import com.web.store.product.model.ProductOrder;
import com.web.store.product.model.ProductOrderDetail;
import com.web.store.product.service.ProductOrderDetailService;

public class ProductOrderDetailServiceimpl implements ProductOrderDetailService {
	@Autowired
	ProductOrderDetailDao productOrderDetailDao;
	@Override
	public ProductOrderDetail addOrderDetail(ProductOrderDetail productOrderDetail) {
		return productOrderDetailDao.addOrderDetail(productOrderDetail);
	}

	 @Override
	public ProductOrderDetail updateOrderDetail(ProductOrderDetail productOrderDetail) {
		return productOrderDetailDao.updateOrderDetail(productOrderDetail);
	}

	 @Override
	public void delete(int id) {
		 productOrderDetailDao.delete(id);
	}
	
	 @Override
	public ArrayList<ProductOrderDetail> queryOrderDetailByProductOrder(ProductOrder ProductOrder) {
		return productOrderDetailDao.queryOrderDetailByProductOrder(ProductOrder);
	}
}
