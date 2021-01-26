package com.web.store.ticket.dao.impl;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.store.ticket.dao.ICreditCardDao;
import com.web.store.ticket.model.CreditCard;

@Repository
public class CreditCardDao implements ICreditCardDao {
	
	@Autowired
	SessionFactory factory;

	@Override
	public CreditCard queryCreditCard(int creditCardId) {
		Session session = factory.getCurrentSession();
		CreditCard creditCard = session.get(CreditCard.class, creditCardId);
		return creditCard;
	}

	@Override
	public ArrayList<CreditCard> queryCreditCardByBank(int bankId) {
		Session session = factory.getCurrentSession();
		String hqlstr = "FROM CreditCard where bankId="+bankId;
		Query<CreditCard> query = session.createQuery(hqlstr,CreditCard.class);
//		 JSONArray array = JSONArray.fromObject(session.createQuery("FROM CreditCard"));
//		    String queryResultString = array.toString();
//		System.out.println(queryResultString);
		return (ArrayList<CreditCard>) query.list();
		
	}

}
