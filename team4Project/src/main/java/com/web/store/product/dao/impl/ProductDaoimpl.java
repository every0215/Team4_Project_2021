package com.web.store.product.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;


import com.web.store.product.controller.ProductBean;
import com.web.store.product.dao.ProductDao;

public class ProductDaoimpl implements ProductDao {
	SessionFactory sessionFactory;
	
	public List<ProductBean> selectAll(){
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from Product";
		Query<ProductBean> queryObj = session.createQuery(hqlstr,ProductBean.class); 			
		return queryObj.list();	
	}
		
	
	public List<ProductBean> selectbyid(int ProductId){
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from Product where ProductId=:ProductId";
		Query<ProductBean> queryObj = session.createQuery(hqlstr,ProductBean.class);
		return queryObj.setParameter("ProductId", ProductId).list();
		
	};
	public List<ProductBean> selectbystoreid(int storeId){
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from Product where storeId=:storeId";
		Query<ProductBean> queryObj = session.createQuery(hqlstr,ProductBean.class);
		return queryObj.setParameter("storeId", storeId).list();
		
	}
	public int insert(ProductBean pb) throws SQLException{
		
		return 1;
	}
	public int deletebyid(int id) throws SQLException{
		return 1;
		
	}
	public int alterbyid(int id) throws SQLException{
		return 1;
		
	}
}
