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
import com.web.store.account.common.Utility;
import com.web.store.account.dao.MemberCreditCardDao;
import com.web.store.account.dao.MemberDao;
import com.web.store.account.javabean.MemberBean;
import com.web.store.account.javabean.MemberCreditCard;

@Repository
public class MemberCreditCardDaoImpl implements MemberCreditCardDao  {
	
	@Autowired
	SessionFactory factory;

	
	@Override
	public MemberCreditCard selectById(int id) throws SQLException {
		Session session = factory.getCurrentSession();
		MemberCreditCard mCreditCard = (MemberCreditCard)session.get(MemberCreditCard.class, id);
		return mCreditCard;	
	}
	
	
	@Override
	public void insert(MemberCreditCard mCreditCard) throws SQLException {
		Session session = factory.getCurrentSession();
		mCreditCard.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		//....
		session.save(mCreditCard);

	}
	
	@Override
	public int deleteById(int id) {
		Session session = factory.getCurrentSession();

		MemberCreditCard mCreditCard = (MemberCreditCard)session.get(MemberCreditCard.class, id);
		if(mCreditCard!=null) {
			session.delete(mCreditCard);
			return 1;
		}
		else {
			return 0;
		}
	}
	
	
	
}
