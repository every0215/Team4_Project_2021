package com.web.store.product.dao;

import java.util.ArrayList;

import com.web.store.product.model.ProductOrder;
import com.web.store.product.model.ProductOrderDetail;

public interface ProductOrderDetailDao {
	 ProductOrderDetail addOrderDetail(ProductOrderDetail productOrderDetail) ;

	 ProductOrderDetail updateOrderDetail(ProductOrderDetail productOrderDetail) ;

	 void delete(int id);
	
	 ArrayList<ProductOrderDetail> queryOrderDetailByProductOrder(ProductOrder ProductOrder) ;
		
}
