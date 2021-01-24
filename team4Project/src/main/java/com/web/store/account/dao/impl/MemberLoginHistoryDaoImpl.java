package com.web.store.account.dao.impl;


import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;
import java.util.Scanner;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.store.account.common.HibernateUtil;
import com.web.store.account.dao.MemberLoginHistoryDao;
import com.web.store.account.javabean.MemberLoginHistory;

@Repository
public class MemberLoginHistoryDaoImpl implements MemberLoginHistoryDao  {
	@Autowired
	SessionFactory factory;

	@SuppressWarnings("unchecked")
	@Override
	public List<MemberLoginHistory> selectAll() throws SQLException {
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		String hql = "FROM MemberLoginHistory";
		List<MemberLoginHistory> members = session.createQuery(hql).getResultList();
		session.close();
		return members;	
	}
	
	@Override
	public void insert(MemberLoginHistory memberLoginHist) throws SQLException {
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		
		//....
		session.save(memberLoginHist);
		session.getTransaction().commit();
		session.close();
	}
	
	
	
}
