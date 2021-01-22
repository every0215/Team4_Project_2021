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
import com.web.store.product.model.Product;
@Repository
public class ProductDaoimpl implements ProductDao {
	@Autowired
	SessionFactory sessionFactory;
	
	public List<Product> selectAll(){
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from Product";
		Query<Product> queryObj = session.createQuery(hqlstr,Product.class); 			
		return queryObj.list();	
	}
		
	
	public List<Product> selectbyid(int ProductId){
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from Product where ProductId=:ProductId";
		Query<Product> queryObj = session.createQuery(hqlstr,Product.class);
		return queryObj.setParameter("ProductId", ProductId).list();
		
	};
	
	
	public int insert(Product pb) throws SQLException{
		Session session = sessionFactory.getCurrentSession();
		session.save(pb);
		return 1;
	}
	public int deletebyid(int id) throws SQLException{
		Session session = sessionFactory.getCurrentSession();
		Product pb = session.get(Product.class, id);
		if(pb!=null) {
			session.delete(pb);
			return 1;
		}
		else return 0;
		
	}
	public int alterbyid(Product pb) throws SQLException{
		Session session = sessionFactory.getCurrentSession();
		
	
		Product pbg = session.get(Product.class, pb.getproductId());
		if(pbg!=null) {
			session.update(pbg);
			
			return 1;
		}else {
			
			return 0;
		}
	
		
	}


	@Override
	public Product getProduct(String productId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from Product where productId = :productId";
		Query<Product> queryObj = session.createQuery(hqlstr,Product.class);
		queryObj.setParameter("ProductId", productId);
		return queryObj.uniqueResult();
	}




}