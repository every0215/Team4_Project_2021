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
		// TODO Auto-generated method stub

	}

	@Override
	public boolean update(Store sto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Store> getAllStore() {
		
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from Store";
		Query<Store> queryObj = session.createQuery(hqlstr,Store.class); 			
		return queryObj.list();	
		
	}

	@Override
	public List<Store> getStoreByArea(String storeArea) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Store> getStoreByName(String store) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean updateStatus(Store sto) {
		// TODO Auto-generated method stub
		return false;
	}

}
