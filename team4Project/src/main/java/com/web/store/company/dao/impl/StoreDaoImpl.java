package com.web.store.company.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.store.company.dao.StoreDao;
import com.web.store.company.model.Company;
import com.web.store.company.model.Store;

@Repository
public class StoreDaoImpl implements StoreDao {

	
	@Autowired
	SessionFactory sessionFactory;
	
	
	@Override
	public void addStore(Store sto) {
		Session session = sessionFactory.getCurrentSession();

		session.save(sto);

	}

	@Override
	public boolean update(Store sto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Store> getAllStoreByCompanyId(Integer id) {
		

		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from Store where CompanyId = :CompanyId";
		Query<Store> queryObj = session.createQuery(hqlstr,Store.class);
		queryObj.setParameter("CompanyId", id);
		
		return queryObj.list();	
		
		
	}

	@Override
	public List<Store> getStoreByArea(String storeArea) {
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from Store where StoreArea = :storeArea";
		Query<Store> queryObj = session.createQuery(hqlstr,Store.class);
		queryObj.setParameter("StoreArea", storeArea);
		
		return queryObj.list();	
	
	}

	@Override
	public List<Store> getStoreByName(String storeName) {
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from Store where StoreName = :storeName";
		Query<Store> queryObj = session.createQuery(hqlstr,Store.class);
		queryObj.setParameter("StoreName", storeName);
		
		return queryObj.list();	
	}

	@Override
	public boolean updateStatus(Integer id,Boolean status) {
		Session session = sessionFactory.getCurrentSession();
		
		Query queryObj = session.createQuery("UPDATE Store SET  Status = :newStatus WHERE Id = :Sid")
				.setParameter("Sid", id)
				.setParameter("newStatus", status);
		
		queryObj.executeUpdate();
		return true;
	}

}
