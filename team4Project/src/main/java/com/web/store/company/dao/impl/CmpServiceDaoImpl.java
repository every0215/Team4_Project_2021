package com.web.store.company.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.web.store.company.dao.CmpServiceDao;

import com.web.store.company.model.CmpService;
@Repository
public class CmpServiceDaoImpl implements CmpServiceDao {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public void addService(CmpService sv) {
		Session session = sessionFactory.getCurrentSession();

		session.save(sv);

	}

	@Override
	public boolean update(CmpService sv) {
		Session session = sessionFactory.getCurrentSession();
		
		CmpService queryResult = null;
		if(sv.getId()!=null) {
			queryResult = session.get(CmpService.class, sv.getId());
			session.evict(queryResult); //清除session的緩存，因為get
		}
		
		if(queryResult != null) {
			session.update(sv);
			return true;
		}
		
		return false;
	}

	@Override
	public List<CmpService> getAllService() {
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "from Service";
		Query<CmpService> queryObj = session.createQuery(hqlstr,CmpService.class); 			
		return queryObj.list();
	}

}
