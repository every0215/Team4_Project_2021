package com.web.store.product.dao.impl;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;


import com.web.store.product.dao.ProductOrderDao;
import com.web.store.product.model.ProductOrder;




public class ProductOrderDaoimpl implements ProductOrderDao{
	@Autowired
	SessionFactory factory;
	@Override
	public ProductOrder addOrder(ProductOrder productOrder) {
		Session session = factory.getCurrentSession();
		session.save(productOrder);
		return productOrder;
	}
	
	@Override
	public ProductOrder alterOrder(ProductOrder productOrder) {
		Session session = factory.getCurrentSession();
		session.update(productOrder);
		return productOrder;
	}
	
	@Override
	public void delete(int id) {
		Session session = factory.getCurrentSession();
		ProductOrder productOrder = session.get(ProductOrder.class, id);
		if(productOrder!=null) {
			session.delete(productOrder);
		}
	}
	
	@Override
	public ArrayList<ProductOrder> queryOrderByMemberId(Integer memberId) {
		Session session = factory.getCurrentSession();
		String hqlstr="FROM ProductOrder where ProductOrder.memberId="+memberId;
		Query<ProductOrder> query = session.createQuery(hqlstr,ProductOrder.class);
		return (ArrayList<ProductOrder>) query.list();
	}
}
