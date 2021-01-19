package com.web.store.product.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.store.campaign.model.Campaign;
import com.web.store.company.model.Company;
import com.web.store.product.dao.ProductDao;
import com.web.store.product.model.ProductBean;
@Repository
public class ProductDaoimpl implements ProductDao {
	@Autowired
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
		Session session = sessionFactory.getCurrentSession();
		session.save(pb);
		return 1;
	}
	public int deletebyid(int id) throws SQLException{
		Session session = sessionFactory.getCurrentSession();
		ProductBean pb = session.get(ProductBean.class, id);
		if(pb!=null) {
			session.delete(pb);
			return 1;
		}
		else return 0;
		
	}
	public int alterbyid(ProductBean pb) throws SQLException{
		Session session = sessionFactory.getCurrentSession();
		
	
		ProductBean pbg = session.get(ProductBean.class, pb.getproductId());
		if(pbg!=null) {
			session.update(pbg);
			System.out.println("11111");
			return 1;
		}else {
			System.out.println("00000");
			return 0;
		}
	
		
	}




}