package com.web.store.customerService.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.store.customerService.model.CustomerService;

@Repository
public class CSDao {
	@Autowired
	SessionFactory sessionFatory;
	
	public CustomerService checkUser(String userId,String userPassword) {
		Session session = sessionFatory.getCurrentSession();
		String hql = "FROM CustomerService WHERE userId=:userId and userPassword=:userPassword";
		CustomerService cs = session.createQuery(hql,CustomerService.class)
				.setParameter("userId", userId)
				.setParameter("userPassword", userPassword)
				.uniqueResult();
		
		return cs;
		
	}
}
