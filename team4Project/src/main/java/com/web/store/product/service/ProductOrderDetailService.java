package com.web.store.product.service;

import java.util.ArrayList;

import com.web.store.product.model.ProductOrder;
import com.web.store.product.model.ProductOrderDetail;

public interface ProductOrderDetailService {

	ProductOrderDetail addOrderDetail(ProductOrderDetail productOrderDetail);

	ProductOrderDetail updateOrderDetail(ProductOrderDetail productOrderDetail);

	void delete(int id);

	ArrayList<ProductOrderDetail> queryOrderDetailByProductOrder(ProductOrder ProductOrder);

}