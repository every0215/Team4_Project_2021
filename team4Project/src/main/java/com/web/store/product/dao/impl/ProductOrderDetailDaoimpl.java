package com.web.store.product.dao.impl;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;


import com.web.store.product.dao.ProductOrderDetailDao;
import com.web.store.product.model.ProductOrder;
import com.web.store.product.model.ProductOrderDetail;


public class ProductOrderDetailDaoimpl implements ProductOrderDetailDao {
	@Autowired
	SessionFactory factory;
	public ProductOrderDetail addOrderDetail(ProductOrderDetail productOrderDetail) {
		Session session = factory.getCurrentSession();
		session.save(productOrderDetail);
		return productOrderDetail;
	}
	
	@Override
	public ProductOrderDetail updateOrderDetail(ProductOrderDetail productOrderDetail) {
		Session session = factory.getCurrentSession();
		session.update(productOrderDetail);
		return productOrderDetail;
	}
	
	@Override
	public void delete(int id) {
		Session session = factory.getCurrentSession();
		ProductOrderDetail productOrderDetail = session.get(ProductOrderDetail.class, id);
		if(productOrderDetail!=null) {
			session.delete(productOrderDetail);
		}
	}
	
	@Override
	public ArrayList<ProductOrderDetail> queryOrderDetailByProductOrder(ProductOrder productOrder) {
		Session session = factory.getCurrentSession();
		String hqlstr="FROM ProductOrderDetail where ProductOrderDetail.ProductOrder="+productOrder;
		Query<ProductOrderDetail> query = session.createQuery(hqlstr,ProductOrderDetail.class);
		return (ArrayList<ProductOrderDetail>) query.list();
	}


}
