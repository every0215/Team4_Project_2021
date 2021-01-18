package com.web.store.ticket.dao.impl;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.store.ticket.dao.IBankDao;
import com.web.store.ticket.model.Bank;

@Repository
public class BankDao implements IBankDao {
	
	@Autowired
	SessionFactory factory;
	
	@Override
	public ArrayList<Bank> queryAllBank() {
		Session session = factory.getCurrentSession();
		String hqlstr = "FROM Bank";
		Query<Bank> query = session.createQuery(hqlstr,Bank.class);
		return (ArrayList<Bank>) query.list();
	}

}
